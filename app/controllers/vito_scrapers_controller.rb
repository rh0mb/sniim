class VitoScrapersController < ApplicationController
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
    @wholesaler = Wholesaler.new(params[:wholesaler])
    url = @wholesaler.name
    product = @wholesaler.address
    doc = Nokogiri::HTML(open(url))




    doc.css(".txtnegro").each do |item|
    	if !item.to_s.include? "Contacto:" 
				if !item.to_s.include? "Directorios Especializados vito"
					name = item.css("strong").text
					name1 = Wholesaler.where(:name => name).first
					if !name1
						phone = br_searcher(item.to_s).strip
						state = item.css("i").text
						if item.css(".linkoran").to_s.include? "@"
							mail = item.css(".linkoran").text
						end
						Wholesaler.create(:name => name, :phone => phone, :state => state, :mail => mail, 
														:line_of_b => "Frutas y Hortalizas", :prodcuts => product)
					end
				end
			end
    end
  end


  def br_searcher(text)
		text = text.split('<br>')
		return text[1]
	end

end
