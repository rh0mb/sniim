class AddMarketToWholesalers < ActiveRecord::Migration
  def change
  	add_column :wholesalers, :market, :text
  	add_column :wholesalers, :contacted_email, :date
  	add_column :wholesalers, :contacted_phone, :date
  	add_column :wholesalers, :comments, :text
  end
end
