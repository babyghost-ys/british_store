class OrderDetail < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :purchase_unit_price, presence: true, numericality: { greater_than: 0 }
  belongs_to :product
  belongs_to :order
end
