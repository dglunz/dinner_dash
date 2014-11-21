class DropAddressesOrders < ActiveRecord::Migration
  def change
    drop_table :addresses_orders
  end
end
