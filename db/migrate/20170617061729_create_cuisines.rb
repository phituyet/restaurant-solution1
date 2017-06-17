class CreateCuisines < ActiveRecord::Migration[5.1]
  def change
    create_table :cuisines do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
