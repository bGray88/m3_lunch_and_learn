class Api::V1::LearningResourcesController < ApplicationController
  def index
    resource_result = LearningResourceFacade.combined_resources(params[:country])
    render json: resource_result
  end
end
