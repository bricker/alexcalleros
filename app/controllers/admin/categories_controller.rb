class Admin::CategoriesController < ApplicationController
  layout 'admin'

  before_filter :login_required
  before_filter :get_category, only: [:show, :edit, :update, :destroy]
  
  respond_to :html
  
  #----------------------
  
  def index
    @categories = Category.order('created_at desc')
  end

  #----------------------
  
  def new
    @category = Category.new
  end
  
  #----------------------
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Added category"
      redirect_to admin_categories_path
    else
      render :new
    end
  end
  
  #----------------------

  def update
    if @category.update_attributes(category_params)
      flash[:notice] = "Updated category"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  #----------------------

  def destroy
    flash[:notice] = "Removed category" if @category.destroy
    redirect_to :admin_categories_path
  end

  #----------------------

  private

  def get_category
    @category = Category.find(params[:id].to_i)
  end

  #----------------------

  def category_params
    params.require(:category).permit(:title)
  end
end
