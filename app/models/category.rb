class Category < ApplicationRecord
  has_many :items
  has_ancestry
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
end
