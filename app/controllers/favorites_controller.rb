class FavoritesController < ApplicationController

  def create
    group = Group.find_by(id: params[:id])
    favorite = Favorite.new({name: group[:name], photo_url: group[:photo_url], url_name: group[:url_name], user_id: current_user.id})
      if favorite.save
        redirect_to current_user
      else
        flash[:error] = "You've already added #{favorite.name} to your meetups."
        redirect_to meetup_index_path
      end
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
    redirect_to current_user
  end
end
