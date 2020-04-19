class DreamsController < ApplicationController


	def new
		@dream = Dream.new
	end

	def create
		@dream = current_user.dreams.build(dream_params)
		if @dream.save
			redirect_to dream_path(@dream)
		else
			render "new"
		end
	end

	def index
		@dreams = Dream.all
	end

	def show
		@dream = Dream.find(params[:id])
		@dream_comments = @dream.dream_comments
		@dream_comment = DreamComment.new
	end

	def edit
		@dream = Dream.find(params[:id])
	end

	def update
		@dream = Dream.find(params[:id])
		if @dream.update(dream_params)
			redirect_to dream_path
		else
			render "edit"
		end
	end

	def destroy
		dream = Dream.find(params[:id])
		dream.destroy
		redirect_to dreams_path(dream.user)
	end

	def search
		@dreams = Dream.search(params[:search])
	end

	private

	def dream_params
		params.require(:dream).permit(:title, :body, :image)
	end
end