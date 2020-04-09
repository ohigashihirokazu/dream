class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create
	end

	def show
		@user = User.find(params[:id])
		@dream_new = Dream.new
	end

	def edit
	end

	def update
	end


end
