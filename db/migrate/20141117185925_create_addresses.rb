class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :street_number
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :order_id

      t.timestamps
    end
  end
end
