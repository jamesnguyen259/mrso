class AddTimeToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_timestamps(:reviews)
  end
end
