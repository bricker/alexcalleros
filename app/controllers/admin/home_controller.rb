class Admin::HomeController < Admin::BaseController
  skip_before_filter :get_record

  def home
    @about_content = Content.find_by_key('about')

    if featured = Category.find_by_slug("featured")
      @featured_video = featured.videos.order("created_at").last
    end
  end
end
