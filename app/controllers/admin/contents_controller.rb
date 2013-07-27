class Admin::ContentsController < ApplicationController
  layout 'admin'

  before_filter :login_required
  before_filter :get_content, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  
  #----------------------
  
  def index
    @contents = Content.order('created_at desc')
  end

  #----------------------
  
  def new
    @content = Content.new
  end
  
  #----------------------
  
  def create
    @content = Content.new(content_params)
    if @content.save
      flash[:notice] = "Added content"
      redirect_to admin_contents_path
    else
      render :new
    end
  end
  
  #----------------------

  def update
    if @content.update_attributes(content_params)
      flash[:notice] = "Updated content"
      redirect_to admin_contents_path
    else
      render :edit
    end
  end

  #----------------------

  def destroy
    flash[:notice] = "Removed content" if @content.destroy
    redirect_to admin_contents_path
  end

  #----------------------

  private

  def get_content
    @content = Content.find(params[:id].to_i)
  end

  #----------------------

  def content_params
    params.require(:content).permit(:key, :text)
  end
end
