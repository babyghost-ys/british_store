class OrderStatus < ApplicationRecord
  validates :name, presence: trues
  has_many :orders, dependent: :delete_all
end
