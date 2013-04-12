class Wholesaler < ActiveRecord::Base
  attr_accessible :address, :name, :phone, :fax, :line_of_b, :prodcuts, :mail, :web_page, :city, 
  								:state, :market, :location_id, :contacted_email, :contacted_phone, :comments 



  def self.ask_search(search, search1, search2)
    if search.nil? || search.empty? && search1.nil? || search1.empty? && search2.nil? || search2.empty?
      find(:all)

    if search == "none" && search3 == "Seleccionar"
      find(:all)
    elsif search != "none" && search2 == "Seleccionar"
      find(:all, :conditions => ['city LIKE ?' , "%#{search1}%"] )
    elsif search == "none" && search2 != "Seleccionar"
      find(:all, :conditions => ['state LIKE ?' , "%#{search2}%"] )
    end
  end
  end













end
