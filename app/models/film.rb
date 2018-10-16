class Film < ApplicationRecord
  ATTRIBUTES_PARAMS = [:name, :description, :picture].freeze

	mount_base64_uploader :picture, PictureUploader

	has_many :reviews
end
