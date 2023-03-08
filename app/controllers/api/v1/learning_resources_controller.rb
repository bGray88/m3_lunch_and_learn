class Api::V1::LearningResourcesController < ApplicationController
  def index
    resource_result = LearningResourceFacade.combined_resources(params[:country])
    if resource_result.is_a?(SearchError)
      raise resource_result, status: :not_found
    else
      render json: resource_result
    end
  end
end
