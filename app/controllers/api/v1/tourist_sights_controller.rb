class Api::V1::TouristSightsController < ApplicationController
  def index
    render json: TouristSightsSerializer.sights(TouristSightFacade.search_sights(params[:country], 500))
  end
end
