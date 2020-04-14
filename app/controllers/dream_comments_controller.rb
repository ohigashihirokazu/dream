class DreamCommentsController < ApplicationController

	def create
		@dream = Dream.find(params[:dream_id])
		@dream_comment = current_user.dream_comments.new(dream_comment_params)
		@dream_comment.dream_id = @dream.id
		if @dream_comment.save
			redirect_back(fallback_location: dream_path)
		else
			render "dreams/show"
		end
	end

	def destroy
		dream = Dream.find(params[:post_image_id])
		favorite = current_user.favorites.find_by(dream_id: dream.id)
		favorite.destroy
		redirect_to dream_path(dream)
	end

	private

	def dream_comment_params
		params.require(:dream_comment).permit(:comment)
	end
end