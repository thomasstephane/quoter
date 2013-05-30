class Product < ActiveRecord::Base
  has_many :quotes
  has_many :quotes, through: :products_quotes
end
