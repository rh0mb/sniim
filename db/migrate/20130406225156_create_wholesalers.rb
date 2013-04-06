class CreateWholesalers < ActiveRecord::Migration
  def change
    create_table :wholesalers do |t|
      t.text :name
      t.text :address
      t.text :phone
      t.text :fax
      t.text :address
      t.text :line_of_b
      t.text :prodcuts
      t.text :mail
      t.text :web_page
      t.integer :location_id
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
