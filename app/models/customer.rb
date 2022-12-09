class Customer < ApplicationRecord
  validates :name, :email, presence: true
  has_many :orders, dependent: :delete_all
end
