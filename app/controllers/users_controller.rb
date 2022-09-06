class UsersController < ApplicationController
  def index
    @users = User.all
    @friends = current_user.friends
    # @pending_requests = current_user.pending_requests
    # @friend_request = current_user.received_requests
  end

  def show
    @user = User.find(params[:id])
  end

  def update_img
    @user = User.find(params[:id])
    if current_user.id == @user.id
      redirect_back(fallback_location: users_path(current_user))
      return
    end

    image = params[:user][:image] if params[:user].nill?
    if image
      @user.image = image
      if @user.save
        flash[:success] = 'Image uploaded'
      else
        flash[:danger] = 'Image uploaded failed'
      end
    end
    redirect_back(fallback_location:root_path)
  end

end
