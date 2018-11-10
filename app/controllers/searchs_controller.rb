class SearchsController < ApplicationController
  def index
    # cái này dùng để search
    @search = Film.search(params[:q])
  	@patients = @search.result
  if params[:q].blank?
  end
end
end
