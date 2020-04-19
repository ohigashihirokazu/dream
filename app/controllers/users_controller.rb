class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@dream = Dream.all
		followarIdList = Relationship.select(:user_id).where(follow_id: current_user.id)
		matchUserIdList = Relationship.select(:follow_id).where('user_id: => current_user.id', 'follow_id: => followerIdList')
		matchUserList = User.where('id: => machUserIdList')
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "successfully updated user!"
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	def ensure_correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def matching
	followarIdList = Relationship.select(:user_id).where(follow_id: current_user.id)
	matchUserIdList = Relationship.select(:follow_id).where('user_id: => current_user.id', 'follow_id: => followerIdList')
	@matchUserList = User.where('id: => machUserIdList')
	render 'show_matching'
  end



private

def user_params
	params.require(:user).permit(:name, :email, :profile, :profile_image)
end
end

