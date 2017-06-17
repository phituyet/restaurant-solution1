class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :food_items, through: :order_items
  accepts_nested_attributes_for :food_items, :order_items
end
