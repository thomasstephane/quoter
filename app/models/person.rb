class Person < ActiveRecord::Base
  has_many :quotes
  has_many :products, through: :quotes
end
