class Product < ApplicationRecord
  validates :name, :description, :current_price, presence: true
  belongs_to :category
  has_one_attached :image
end
