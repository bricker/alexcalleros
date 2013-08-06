class Admin::VideosController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Video,
      :order        => "created_at desc"
    }
  end

  def form_params
    params.require(:video).permit(
      :title,
      :description,
      :url,
      :embed_code,
      :slug,
      :category_id,
      :thumbnail,
      :remove_thumbnail,
      :position
    )
  end
end
