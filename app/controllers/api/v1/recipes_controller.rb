class Api::V1::RecipesController < ApplicationController
  def index
    search_result = EdamamService.search_by_name(params[:search])

    render json: RecipesSerializer.recipe(search_result, params[:search]) unless search_result[:hits].empty?
    render json: CommonSerializer.empty if search_result[:hits].empty?
    raise SearchError.new unless search_result
  end
end
