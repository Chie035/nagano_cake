class AddProductionToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :production, :integer, null: false, default: 0
  end
end
