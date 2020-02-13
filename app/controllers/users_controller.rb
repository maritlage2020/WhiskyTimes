class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@reviews = @user.reviews
    @reviews = @reviews.order("created_at ").page(params[:page])
  end

  def index
    @users = User.order("created_at ").page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    if current_user
       @user = User.find(params[:id])
       if @user.update(user_params)
       	flash[:success] = "You have updated user successfully."
          redirect_to user_path(@user.id)
         else
          flash[:danger] = @user.errors.full_messages
          render "edit"
       end
     else
    end
   end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
    @users = @users.page(params[:page])
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @users = @users.page(params[:page])
    render 'show_follower'
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end