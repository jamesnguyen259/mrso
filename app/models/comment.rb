class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  mount_base64_uploader :avatar, PictureUploader

  delegate :email, to: :user, allow_nil: true
  delegate :avatar, to: :user, allow_nil: true
  delegate :id, to: :user, prefix: :user
  ATTRIBUTES_PARAMS = %i(review_id content).freeze
end
