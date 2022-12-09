class Order < ApplicationRecord
  validates :amount_total, presence: true, numericality: { greater_than: 0 }
  validates :amount_subtotal, presence: true, numericality: { greater_than: 0 }

  belongs_to :customer
  belongs_to :order_status
  has_many :order_details, dependent: :delete_all
end
