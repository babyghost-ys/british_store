class OrderStatus < ApplicationRecord
  has_many :orders, dependent: :delete_all
end
