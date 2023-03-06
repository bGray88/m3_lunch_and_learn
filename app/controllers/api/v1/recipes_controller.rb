class Api::V1::RecipesController < ApplicationController
  def index
    search_result = RecipeFacade.recipes(params[:country])
    render json: search_result
  end
end
