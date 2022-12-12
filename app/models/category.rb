class Category < ApplicationRecord
  validates :name, :description, presence: true
  has_many :products, dependent: :delete_all
end
