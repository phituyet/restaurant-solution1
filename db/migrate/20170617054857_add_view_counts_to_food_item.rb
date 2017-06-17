class AddViewCountsToFoodItem < ActiveRecord::Migration[5.1]
  def change
    add_column :food_items, :view, :integer, default: 0
  end
end
