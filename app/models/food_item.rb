class FoodItem < ApplicationRecord
  belongs_to :section
  belongs_to :cuisine
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :reviews

  scope :in_array, -> (food_items) { where(id: food_items) }
  scope :in_section, -> (section_id) { where("section_id = ?", section_id) if section_id.present?}
  scope :search, -> (s) { where("name ILIKE ?", "%#{s}%") if s.present?}
  scope :cuisine, -> (slug) { joins(:cuisine).where('cuisines.slug = ?', slug) if slug.present? }
  scope :custom_order, -> (orderValue) { 
    if orderValue.present?
      attribute, type = orderValue.split('-')
      order("#{attribute} #{type.upcase}")
    else 
      order("name ASC")
    end
  }
end
