class FilmsController < ApplicationController
	def index
		@films = Film.all
	end

  def new
  	@film = Film.new
  end

  def create
  	@film = Film.new film_params
  	unless @film.save
  		render :new
  	end
  end

  private

  def film_params
    params.require(:film).permit Film::ATTRIBUTES_PARAMS
  end
end
