class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :delivery

      t.timestamps
    end
  end
end
