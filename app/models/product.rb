class Product < ApplicationRecord
  validates :name, :description, :current_price, presence: true
  belongs_to :category
  has_one_attached :image
  has_many :order_detail, dependent: :delete_all
end
