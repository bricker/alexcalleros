class Admin::ResourceController < Admin::BaseController
  before_filter :get_record, only: [:show, :edit, :update, :destroy]

  def index
    @records = model[:class].order(model[:order])
  end

  def new
    @record = model[:class].new
  end

  def edit
  end

  def show
    render :edit
  end

  def create
    @record = model[:class].new(form_params)
    if @record.save
      flash[:notice] = "Added #{model[:class]}"
      redirect_to model[:index_path]
    else
      render :new
    end
  end

  def update
    if @record.update_attributes(form_params)
      flash[:notice] = "Updated #{model[:class]}"
      redirect_to model[:index_path]
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Removed #{model[:class]}" if @record.destroy
    redirect_to model[:index_path]
  end


  private

  def get_record
    @record = model[:class].find(params[:id])
  end
end
