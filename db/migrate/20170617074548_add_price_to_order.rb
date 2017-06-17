class AddPriceToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :price, :decimal
    add_column :orders, :price_total, :decimal
  end
end
