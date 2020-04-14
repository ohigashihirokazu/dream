class FavoritesController < ApplicationController

	def create
		dream = Dream.find(params[:dream_id])
		favorite = current_user.favorites.new(dream_id: dream.id)
		favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		dream = Dream.find(params[:dream_id])
		favorite = current_user.favorites.find_by(dream_id: dream.id)
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end
end
