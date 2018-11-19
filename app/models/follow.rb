class Follow < ApplicationRecord
	belongs_to :user
	scope :check_followed, ->(user_id, followed_id){
		where(user_id: user_id, follow_id: followed_id)
	}
end
