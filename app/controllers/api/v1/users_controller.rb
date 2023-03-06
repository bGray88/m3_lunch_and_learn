class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(JSON.parse(request.body.read, symbolize_names: true)[:user])
    user.update(api_key: User.random_key)
    if user.save
      render json: UsersSerializer.user(user), status: :created
    else
      raise CreateError.new(details: user.errors.full_messages.to_sentence), status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end
