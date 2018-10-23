class Review < ApplicationRecord
	ATTRIBUTES_PARAMS = [:content, :film_id].freeze
  belongs_to :user
  belongs_to :film
  has_many :comments

	acts_as_votable
end
