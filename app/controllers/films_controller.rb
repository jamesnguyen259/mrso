class FilmsController < ApplicationController
	before_action :find_film, only: %i(show edit update)

	def index
		@films = Film.all
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
    params.require(:film).permit Film::ATTRIBUTES_PARAMS,:release_day, category_ids:[]
  end

	def find_film
		@film = Film.find_by id: params[:id]
		return if @film
		flash[:warning] = "Can't find film!"
		redirect_to root_url
	end
end
