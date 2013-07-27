class Admin::VideosController < ApplicationController
  layout 'admin'

  before_filter :login_required
  before_filter :get_video, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  
  #----------------------
  
  def index
    @videos = Video.order('created_at desc')
  end

  #----------------------
  
  def new
    @video = Video.new
  end
  
  #----------------------
  
  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = "Added video"
      redirect_to admin_videos_path
    else
      render :new
    end
  end
  
  #----------------------

  def update
    if @video.update_attributes(video_params)
      flash[:notice] = "Updated video"
      redirect_to admin_videos_path
    else
      render :edit
    end
  end

  #----------------------

  def destroy
    flash[:notice] = "Removed video" if @video.destroy
    redirect_to admin_videos_path
  end

  #----------------------

  private

  def get_video
    @video = Video.find(params[:id].to_i)
  end

  #----------------------

  def video_params
    params.require(:video).permit(:title, :description, :video_embed_url, :category_id)
  end
end
