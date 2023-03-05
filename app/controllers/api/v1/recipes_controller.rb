class Api::V1::RecipesController < ApplicationController
  def index
    search_result = RecipeFacade.recipe(params[:search])
    raise SearchError.new unless search_result.first
    if (search_result.first[:hits].empty? && params[:search]) || params[:search] == ""
      render json: CommonSerializer.empty
    else
      render json: RecipesSerializer.recipe(search_result.first, search_result.last)
    end
  end
end
