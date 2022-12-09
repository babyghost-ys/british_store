class Product < ApplicationRecord
  validates :name, :description, :current_price, presence: true
  validates :current_price, numericality: { greater_than: 0 }
  belongs_to :category
  has_one_attached :image
  has_many :order_detail, dependent: :delete_all
end
