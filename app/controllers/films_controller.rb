class FilmsController < ApplicationController
	before_action :find_film, only: %i(show edit update)
	before_action :category_all, only: %i(index show)

	def index
		@q = Film.ransack params[:q]
		@films = @q.result.includes(:reviews).page(params[:page])
		@films_new = Film.last(4)
	end

  def new
  	@film = Film.new
  end

  def create
  	@film = Film.new film_params
  	if @film.save
  		redirect_to @film
		else
			render :new
  	end
  end

	def show
		@q = Film.ransack params[:q]
		@films = @q.result.includes(:reviews).page(params[:page])
		if user_signed_in?
			@review = current_user.reviews.new
		end
		@reviews = @film.reviews
	end

	def edit; end

	def update
		if @film.update_attributes(film_params)
			flash[:success] = "Updated!"
			redirect_to root_url
		else
			render :edit
		end
	end

  private

  def film_params
    params.require(:film).permit Film::ATTRIBUTES_PARAMS,
		  :release_day, :duration, category_ids:[]
  end

	def find_film
		@film = Film.find_by id: params[:id]
		return if @film
		flash[:warning] = "Can't find film!"
		redirect_to root_url
	end

	def category_all
		@categories = Category.distinct.uniq
	end
end
