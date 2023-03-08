class Api::V1::RecipesController < ApplicationController
  def index
    recipes_result = RecipeFacade.recipes(params[:country])
    render json: recipes_result
  end
end
