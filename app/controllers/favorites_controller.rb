class FavoritesController < ApplicationController
  include ApplicationHelper
  
  def create
    favorite = current_user.favorites.create(home_id: params[:home_id])
    redirect_to homes_url, notice: "#{favorite.home.user.name}さんのhomeをお気に入り登録しました"
  end
  
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to homes_url, notice: "#{favorite.home.user.name}さんのhomeをお気に入り解除しました"
  end
  
  def index
    if logged_in?
      @favorite = current_user.favorite_homes.all
    end
  end
end
