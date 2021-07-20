class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.integer :costomer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :price
      t.integer :shipping_cost
      t.timestamps
    end
  end
end
