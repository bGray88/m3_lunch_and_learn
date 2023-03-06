class Api::V1::TouristSightsController < ApplicationController
  def index
    sights = TouristSightFacade.search_sights(params[:country], 500)
    if sights.present?
      render json: TouristSightsSerializer.sights(sights)
    else
      render json: CommonsSerializer.empty
    end
  end
end
