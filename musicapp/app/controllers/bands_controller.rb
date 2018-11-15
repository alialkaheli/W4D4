class BandsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    @band.user_id = current_user.id

    if @band.save
      redirect_to band_url(@band)
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band
      @band.destroy
      redirect_to bands_url
    else
      render json: ["You cannot delete what you cannot find."], status: 404
    end
  end

  def band_params
    params.require(:band).permit(:name, :user_id)
  end
end
