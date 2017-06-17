class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :point
      t.text :comment
      t.references :food_item, foreign_key: true

      t.timestamps
    end
  end
end
