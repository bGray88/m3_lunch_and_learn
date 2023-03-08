class Api::V1::RecipesController < ApplicationController
  def index
    recipes_result = RecipeFacade.recipes(params[:country])
    if recipes_result.is_a?(SearchError)
      raise recipes_result, status: :not_found
    else
      render json: recipes_result
    end
  end
end
