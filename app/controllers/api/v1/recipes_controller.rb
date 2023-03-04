class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipesSerializer.recipe(EdamamService.search_by_name(params[:search]), params[:search])
  end
end
