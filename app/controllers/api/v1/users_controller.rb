class Api::V1::UsersController < ApplicationController
  def create
    raise CreateError.new(details: "user data is missing or invalid"), status: :bad_request if request.body.read.blank?
    user = User.new(JSON.parse(request.body.read, symbolize_names: true)[:user])
    user.update(api_key: User.random_key)
    if user.save
      render json: UsersSerializer.user(user), status: :created
    else
      raise CreateError.new(details: user.errors.full_messages.to_sentence), status: :bad_request
    end
  end

  def show
    render json: User.find_by(id: params[:id])
  end
end
