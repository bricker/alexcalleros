class HomeController < ApplicationController
  def home
    @contents = Content.all

    @resume_url     = @contents.find { |c| c.key == "resume_url" }
    @reel_url       = @contents.find { |c| c.key == "reel_url" }
    @contact_email  = @contents.find { |c| c.key == "contact_email" }

    @categories = Category.order('position').includes(:videos).all
  end

  def about
    if content = Content.find_by_key('about')
      @text = content.text
    end

    render layout: false
  end
end
