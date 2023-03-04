class ApplicationController < ActionController::API
  rescue_from StandardError::SearchError, with: :error_response_search

  def error_response_search(error)
    render json: ErrorSerializer.error_json(error), status: 404
  end
end
