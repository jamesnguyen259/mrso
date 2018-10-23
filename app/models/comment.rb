class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  ATTRIBUTES_PARAMS = %i(review_id content).freeze
end
