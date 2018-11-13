class ReviewsController < ApplicationController
	before_action :find_review, only: %i(show like unlike edit update destroy)
	before_action :category_all, only: %i(index show)

	def index
		@reviews = Review.all
	end

  def new
  end

  def create
  	@review = current_user.reviews.new review_params
  	if @review.save
  		redirect_to @review
  	end
  end

  def show
		@q = Film.ransack params[:q]
		@films = @q.result.includes(:reviews).page(params[:page])
  	@film = Film.find_by id: @review.film_id
  	@user = User.find_by id: @review.user_id
		if user_signed_in?
    	@comment = current_user.comments.new
    	@comments = @review.comments
		  commontator_thread_show(@review)
		end
  end

	def like
		@review.liked_by current_user
		respond_to do |format|
      format.html
      format.js
    end
	end

	def unlike
	  @review.unliked_by current_user
	  respond_to do |format|
	    format.html
	    format.js
	  end
  end

  def edit
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to @review.film
    else
      render "edit"
    end
  end

  def destroy
    if @review.destroy
      @reviews = @review.film.reviews
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  private
  def review_params
    params.require(:review).permit Review::ATTRIBUTES_PARAMS
  end

  def find_review
  	@review = Review.find_by id: params[:id]
  end

	def category_all
		@categories_name = Category.distinct.pluck(:name)
	end
end
