class WholeScrapersController < ApplicationController
	require 'nokogiri'
  require 'open-uri'
	

	def new
    @wholesaler = Wholesaler.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wholesaler }
    end
  end


  def create
  	data = []
    @wholesaler = Wholesaler.new(params[:wholesaler])
    txtcounter = @wholesaler.name
    pages = @wholesaler.address.to_i
    location = @wholesaler.phone
    city = @wholesaler.city
    state = @wholesaler.state
    market = @wholesaler.market

    for i in 0..pages
    	if i > 0
    		url = "http://www.economia-sniim.gob.mx/dircomer/Consul03b.asp?txtcounter="
    		url = url + "#{txtcounter}" + "&pag=" + "#{i}" + "&Central=" + "#{location}" + "&Giro=Frutasyhortalizas&Producto=1"
    		data = parser(url)
    		records = data.count/8 - 1
    		x = 0
    		for i in 0..records
    			Wholesaler.create(:name => data[0+x], :address => data[1+x], :phone => data[2+x], 
    												:fax => data[3+x], :line_of_b => data[4+x], :prodcuts => data[5+x],
    												:mail => data[6+x], :web_page => data[7+x], :location_id => location,
    												:city => city, :state => state , :market => market,  )
    			x += 8
    		end
    	end
    end
    
  


    # respond_to do |format|
    #   if @wholesaler.save
    #     format.html { redirect_to @wholesaler, notice: 'Wholesaler was successfully created.' }
    #     format.json { render json: @wholesaler, status: :created, location: @wholesaler }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @wholesaler.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  def parser(link)
  	url = link
		doc = Nokogiri::HTML(open(url))
		loop_num = 0
		data = ""
		data_array = []
		doc.css(".Datos").each do |item|
			item_clean = item.text.gsub(/&nbsp;/i, "").gsub(/\s+/, " ").strip
			if !item.css("a").empty?
				if item.at_css("a")[:href].include? "---"
					data_array[loop_num] = ""
				else
					if loop_num.even? #it is in column 6 of 7 (0 to 7) => it is an email
						data_array[loop_num] = mail_extractor(item.at_css("a")[:href])
					else #it is in column 7 of 7 (0 to 7) => it is a website
						data_array[loop_num] = item.at_css("a")[:href]
					end
				end
			else
				data_array[loop_num] = item_clean
			end
			loop_num += 1
		end
			data_array
  end

	def mail_extractor(mail) #funtcion to remove the mailto part from a mail string
		mail = mail.split(':')
		return mail[1]
	end

end
