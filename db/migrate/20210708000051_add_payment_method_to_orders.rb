class AddPaymentMethodToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_method, :integer, null: false, default: 0
  end
end
