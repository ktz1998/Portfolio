class Item < ApplicationRecord
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
  validates :description, length: { maximum: 252 }
  validates :review, length: { minimum: 1, maximum: 800 }

  belongs_to :user
  has_many :comments
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags, dependent: :destroy
  has_one_attached :image
  

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
end
