class Admin::CategoriesController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Category,
      :order        => "created_at desc"
    }
  end

  def form_params
    params.require(:category).permit(:key, :title, :position)
  end
end
