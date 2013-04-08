class Wholesaler < ActiveRecord::Base
  attr_accessible :address, :name, :phone, :fax, :line_of_b, :prodcuts, :mail, :web_page, :city, 
  								:state, :market, :location_id
end
