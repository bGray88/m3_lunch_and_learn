class Api::V1::RecipesController < ApplicationController
  def index
    if params[:search]
      country = params[:search]
    else
      country = CountriesSerializer.country(RestCountryFacade.random_country).dig(:data, :attributes, :name)
    end
    search_result = EdamamService.search_by_name(country)
    raise SearchError.new unless search_result
    if (search_result[:hits].empty? && params[:search]) || params[:search] == ""
      render json: CommonSerializer.empty
    else
      render json: RecipesSerializer.recipe(search_result, country)
    end
  end
end
