class CreateAddressOrdersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :addresses, :orders do |t|
      t.index [:address_id, :order_id]
      t.index [:order_id, :address_id]
    end
  end
end
