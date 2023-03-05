class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.update(api_key: User.random_key)
    if user.save
      render json: { success: "user has been successfully created" }, status: :created
    else
      raise CreateError.new(details: user.errors.full_messages.to_sentence)
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
