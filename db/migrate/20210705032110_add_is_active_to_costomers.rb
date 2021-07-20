class AddIsActiveToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :is_active, :boolean, default:true, null:false
  end
end
