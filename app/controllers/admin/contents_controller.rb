class Admin::ContentsController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Content,
      :order        => "created_at desc"
    }
  end

  def form_params
    params.require(:content).permit(:key, :text)
  end
end
