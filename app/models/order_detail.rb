class OrderDetail < ApplicationRecord
  validates :quantity, presence: true, numericality: true
  validates :purchase_unit_price, presence: true, numericality: true
  belongs_to :product
  belongs_to :order
end
