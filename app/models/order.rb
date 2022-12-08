class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :delete_all
end
