class Admin::CategoriesController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Category,
      :order        => "position"
    }
  end

  def form_params
    params.require(:category).permit(:slug, :title, :position)
  end
end
