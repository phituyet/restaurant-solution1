class FoodItem < ApplicationRecord
  belongs_to :section
  scope :in_section, -> (section_id) { where("section_id = ?", section_id) if section_id.present?}
  scope :search, -> (s) { where("name ILIKE ?", "%#{s}%") if s.present?}
  scope :custom_order, -> (orderValue) { 
    if orderValue.present?
      attribute, type = orderValue.split('-')
      order("#{attribute} #{type.upcase}")
    else 
      order("name ASC")
    end
  }

  def self.filter(attributes)
    attributes.select { |k, v| v.present? }.reduce(all) do |scope, (key, value)|
      
    end  
  end
end
