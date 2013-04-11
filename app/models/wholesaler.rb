class Wholesaler < ActiveRecord::Base
  attr_accessible :address, :name, :phone, :fax, :line_of_b, :prodcuts, :mail, :web_page, :city, 
  								:state, :market, :location_id



  def self.ask_search(search, search1, search2)
    if search == "Seleccionar" && search2 == "Seleccionar"
      find(:all)
    elsif search != "Seleccionar" && search2 == "Seleccionar"
      find(:all, :conditions => ['produce LIKE ?' , "%#{search}%"] )
    elsif search == "Seleccionar" && search2 != "Seleccionar"
      find(:all, :conditions => ['or_state LIKE ?' , "%#{search2}%"] )
    else
      find(:all, :conditions => ['produce LIKE ? AND or_country LIKE ? AND or_state LIKE ?', "%#{search}%", "%#{search1}%","%#{search2}%" ] )
    end
  end













end
