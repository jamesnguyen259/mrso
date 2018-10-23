class VotesController < ApplicationController
  def create
    @review = Review.find_by id: params[:id]
    @review.liked_by current_user
		respond_to do |format|
      format.html {redirect_to @review}
      format.js {render :vote}
    end
  end

  def destroy
    @review = Review.find_by id: params[:id]
    @review.unliked_by current_user
		respond_to do |format|
      format.html {redirect_to @review}
      format.js {render :vote}
    end
  end
end
