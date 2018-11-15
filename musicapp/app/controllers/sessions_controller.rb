class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, only: [:new, :create]

  def new #stays empty
    render :new
  end

  def create
    user = find_by_credentials(
      params[:user][:email]
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["invalid account"]
      render :new
    else
      login(user)
      redirect_to bands_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
