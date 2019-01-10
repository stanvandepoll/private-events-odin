class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_show_url(@user)
  end

  def show
    @user = User.find_by(id: params[:format])
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
  end

  def login
    session[:logged_in_user_id] = params[:user_id]
    @user = User.find_by(id: session[:logged_in_user_id])
    redirect_to user_show_url(@user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
