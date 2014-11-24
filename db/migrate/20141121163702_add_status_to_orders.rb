class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pending, :boolean
  end
end
