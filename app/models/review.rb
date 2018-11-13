class Review < ApplicationRecord
	ATTRIBUTES_PARAMS = [:content, :film_id].freeze
  belongs_to :user
  belongs_to :film
  has_many :comments
  mount_base64_uploader :avatar, PictureUploader

  delegate :email, to: :user, allow_nil: true
  delegate :avatar, to: :user, allow_nil: true
  delegate :id, to: :user, prefix: :user
	acts_as_votable
	acts_as_commontable
	ratyrate_rateable "speed"
end
