class OrderStatus < ApplicationRecord
  validates :name, presence: true
  has_many :orders, dependent: :delete_all
end
