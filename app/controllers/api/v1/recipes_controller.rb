class Api::V1::RecipesController < ApplicationController
  def index
    search_result = RecipeFacade.recipes(params[:country]) unless params[:country]&.empty?
    if params[:country]&.empty? || (search_result.first[:hits].empty? && params[:country])
      render json: CommonsSerializer.empty
    else
      render json: RecipesSerializer.recipes(search_result.first, search_result.last)
    end
  end
end
