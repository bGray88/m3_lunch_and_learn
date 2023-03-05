class Api::V1::LearningResourcesController < ApplicationController
  def index
    resource = LearningResourceFacade.combined_resources(params[:country])
    render json: LearningResourceSerializer.resource(resource.first, resource.last)
  end
end
