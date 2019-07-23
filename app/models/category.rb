class Category < ApplicationRecord
  has_many :collections
  has_many :products
end
