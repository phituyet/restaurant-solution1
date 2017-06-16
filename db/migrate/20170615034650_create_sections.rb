class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
