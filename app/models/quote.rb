class Quote < ActiveRecord::Base
  belongs_to :person
  has_many :products
  has_many :products, through: :products_quotes
end
