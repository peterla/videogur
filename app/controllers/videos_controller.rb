class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    # Get fields from params
    # Create object using those params
    @video = Video.new(video_params)

    # Save it to the database
    if @video.save
      # If it saved properly, redirect
      redirect_to videos_url
    else
      # If it didn't save properly, render the new page again
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])

    if @video.update_attributes(video_params)
      redirect_to video_url(@video.id)
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_url
  end

  private
  def video_params
    params.require(:video).permit(:title, :author, :description, :rating, :url)
  end

end
