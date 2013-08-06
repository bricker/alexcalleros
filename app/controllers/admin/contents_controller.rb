class Admin::ContentsController < Admin::ResourceController

  private

  def model
    @model_info ||= {
      :class        => Content,
      :order        => "key"
    }
  end

  def form_params
    params.require(:content).permit(:key, :text)
  end
end
