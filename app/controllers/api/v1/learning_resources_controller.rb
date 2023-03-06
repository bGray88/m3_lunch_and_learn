class Api::V1::LearningResourcesController < ApplicationController
  def index
    resource = LearningResourceFacade.combined_resources(params[:country])
    unless resource[0] == {}
      resource[0] = VideosSerializer.video(resource[0])
    end
    render json: LearningResourcesSerializer.resource(resource.first, resource.last)
  end
end
