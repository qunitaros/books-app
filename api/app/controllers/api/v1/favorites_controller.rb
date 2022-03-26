class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    favorites = Favorite.filter_by_post(params[:post_id]).select(:id, :user_id, :post_id)
    render json: { status: 200, favorites: favorites }
  end

  def create
    favorite = Favorite.new(favorite_params)
    if favorite.save
      render json: { status: 200, favorite: favorite }
    else
      render json: { status: 500, message: "作成に失敗しました。" }
    end
  end

  def destroy
    @favorite = current_api_v1_user.favorites.find(params[:id])
    @favorite.destroy
    render json: { status: 200, favorite: @favorite }
  end

  private

  def favorite_params
    params.permit(:post_id, :user_id)
  end
end
