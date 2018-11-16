class AlbumsController < ApplicationController

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render json: @album.errors.full_messages, status: 400
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url
    else
      render json: @album.errors.full_messages, status: 400
    end
  end

  def destroy
    @album = Band.find(params[:id])
    if @album
      @album.destroy
      redirect_to albums_url
    else
      render json: ["You cannot delete what you cannot find."], status: 404
    end
  end

  def album_params
    params.require(:album).permit(:year, :band_id, :title, :type)
  end
end
