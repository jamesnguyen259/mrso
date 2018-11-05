class Film < ApplicationRecord
  ATTRIBUTES_PARAMS = [:name, :description, :picture].freeze

	mount_base64_uploader :picture, PictureUploader

	has_many :reviews
  has_many :kinds, dependent: :destroy
  has_many :categories, through: :kinds
  accepts_nested_attributes_for :kinds, allow_destroy: true
end
