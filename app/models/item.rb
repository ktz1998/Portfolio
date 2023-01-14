class Item < ApplicationRecord
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

  belongs_to :user
  has_one_attached :image
  
  
end
