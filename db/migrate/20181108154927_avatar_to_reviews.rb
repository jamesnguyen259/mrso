class AvatarToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :avatar, :string
  end
end
