class DreamsController < ApplicationController

	def index
		@dream = Dream.new
		@dreams = Dream.all
	end

	def create
		@dream = Dream.new(dream_params)
		@dream.user_id = current_user.id
		if @dream.save
			redirect_back(fallback_location: users_path)
		else
			render "index"
	end
end

	def show
		@dream = Dream.new
		@dream = Dream.find(params[:id])
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
		@dream = Dream.find(params[:id])
		@dream.destroy
		redirect_to dream_path
	end


private

def dream_params
	params.require(:dream).permit(:title, :body)
end

end