class Product < ApplicationRecord
  belongs_to :category
  has_many :shopping_cart_items
end
