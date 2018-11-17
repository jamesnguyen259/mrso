class Review < ApplicationRecord
	ATTRIBUTES_PARAMS = [:content, :film_id].freeze
  belongs_to :user
  belongs_to :film
  has_many :comments
  mount_base64_uploader :avatar, PictureUploader

  delegate :email, to: :user, allow_nil: true
  delegate :avatar, to: :user, allow_nil: true
  delegate :id, to: :user, prefix: :user
  delegate :name, to: :film, allow_nil: true
	acts_as_votable
	acts_as_commontable
	ratyrate_rateable "speed"
  paginates_per 3

  scope :join_with_follows, -> {
    joins("JOIN follows ON reviews.user_id = follows.follow_id")
  }

  scope :check_conection, ->(user) {
    where("follows.user_id = ?", user.id)
  }

  scope :ordered_by_created_at, -> {order(created_at: :DESC)}
  
end
