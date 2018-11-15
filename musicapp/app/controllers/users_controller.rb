class UsersController < ApplicationController
  before_action :require_logged_out

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      login(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @users = User.find_by(id: params[:id])
    render :show
  end

  def user_param
    params.require(:user).permit(:email, :password)
  end
end
