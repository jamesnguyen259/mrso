class Category < ApplicationRecord
  has_many :kinds
  has_many :films, through: :kinds
  accepts_nested_attributes_for :kinds
end
