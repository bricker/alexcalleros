class Admin::CategoriesController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Category,
      :index_path   => admin_categories_path,
      :order        => "created_at desc"
    }
  end

  def form_params
    params.require(:category).permit(:key, :title)
  end
end
