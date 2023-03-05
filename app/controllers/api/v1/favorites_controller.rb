class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, only: [:create, :index]

  def index
    render json: Favorites
  end

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: { success: "favorite has been successfully created" }, status: :created
    else
      raise CreateError.new(details: favorite.errors.full_messages.to_sentence), status: :bad_request
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(
      :country,
      :recipe_link,
      :recipe_title,
      :user_id
    )
  end

  def find_user
    @user = User.find_by(user_id: favorite_params[:user_id])
    unless @user
      raise CreateError.new(details: "unable to locate existing user"), status: :not_found
    end
  end
end
