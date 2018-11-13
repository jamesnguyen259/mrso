class CategoriesController < ApplicationController
  def show
    @category = Category.find_by id: params[:id]
    @films = @category.films.page(params[:page])
    @categories = Category.distinct
  end

  private
  def category_params
    params.require(:category).permit :name
  end

end
