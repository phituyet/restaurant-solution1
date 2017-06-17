class AddCuisineToFoodItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :food_items, :cuisine, foreign_key: true
  end
end
