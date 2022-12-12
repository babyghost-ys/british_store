class Order < ApplicationRecord
  validates :payment_intent, :payment_status, :payment_method, :stripe_status, presence: true
  validates :amount_total, presence: true, numericality: true
  validates :amount_tax, presence: true, numericality: true
  validates :amount_subtotal, presence: true, numericality: true

  belongs_to :customer
  belongs_to :order_status
  has_many :order_details, dependent: :delete_all
end
