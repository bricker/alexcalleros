class Admin::HomeController < Admin::BaseController
  skip_before_filter :get_record

  def home
    @about_content = Content.find_by_key('about')

    if category = Category.find_by_key("featured")
      @featured_video = category.videos.order("created_at").last
    end
  end
end
