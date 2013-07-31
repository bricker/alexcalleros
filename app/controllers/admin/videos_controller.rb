class Admin::VideosController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Video,
      :index_path   => admin_videos_path,
      :order        => "created_at desc"
    }
  end

  def form_params
    params.require(:video).permit(
      :title, :description, :embed_url, :category_id
    )
  end
end
