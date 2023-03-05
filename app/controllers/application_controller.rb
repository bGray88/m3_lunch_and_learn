class ApplicationController < ActionController::API
  rescue_from StandardError::SearchError, with: :error_response_search
  rescue_from StandardError::CreateError, with: :error_response_create

  def error_response_search(error)
    render json: ErrorSerializer.error_json(error), status: 404
  end

  def error_response_create(error)
    render json: ErrorSerializer.error_json(error), status: 404
  end
end
