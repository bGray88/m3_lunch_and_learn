class Api::V1::FavoritesController < ApplicationController
  before_action :find_user, only: [:create]

  def index
    @user = User.find_by(api_key: params[:api_key])
    if @user
      render json: FavoritesSerializer.favorites(@user.favorites)
    else
      raise SearchError.new, status: :not_found
    end
  end

  def create
    raise CreateError.new(details: "unable to locate existing user"), status: :not_found unless @user
    favorite = Favorite.new(JSON.parse(request.body.read, symbolize_names: true)[:favorite])
    if favorite.save
      render json: { success: "favorite has been successfully created" }, status: :created
    else
      raise CreateError.new(details: favorite.errors.full_messages.to_sentence), status: :bad_request
    end
  end

  private

  def find_user
    @user = User.find_by(api_key: JSON.parse(request.body.read, symbolize_names: true).dig(:favorite, :api_key))
  end
end
