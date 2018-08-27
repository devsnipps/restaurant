class AddCategoryIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :category_id, :integer, index: true
  end
end
