class Api::V1::TouristSightsController < ApplicationController
  def index
    sights = TouristSightsSerializer.sights(TouristSightFacade.search_sights(params[:country], 500))
    unless sights.nil? || sights.empty?
      render json: sights
    else
      render json: CommonsSerializer.empty
    end
  end
end
