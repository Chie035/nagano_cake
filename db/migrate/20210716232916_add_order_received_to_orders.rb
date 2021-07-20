class AddOrderReceivedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_received, :integer, null: false, default: 0
  end
end
