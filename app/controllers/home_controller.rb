class HomeController < ApplicationController
  def home
    @contents = Content.all

    @resume_url     = @contents.find { |c| c.key == "resume_url" }.try(:text)
    @contact_email  = @contents.find { |c| c.key == "contact_email" }.try(:text)

    @categories = Category.order('position').all
  end

  def about
    if content = Content.find_by_key('about')
      @text = content.text
    end

    render layout: 'minimal'
  end

  def video
    @video = Video.find_by_slug!(params[:slug])
    render layout: 'minimal'
  end
end
