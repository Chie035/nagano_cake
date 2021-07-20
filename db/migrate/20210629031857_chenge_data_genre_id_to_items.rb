class ChengeDataGenreIdToItems < ActiveRecord::Migration[5.2]
  def change
     change_column :items, :genre_id, :reference
  end
end
