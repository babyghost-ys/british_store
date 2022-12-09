class Order < ApplicationRecord
  validates :amount_total, presence: true, numericality: true
  validates :amount_subtotal, presence: true, numericality: true

  belongs_to :customer
  belongs_to :order_status
  has_many :order_details, dependent: :delete_all
end
