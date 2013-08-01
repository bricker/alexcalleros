class Video < ActiveRecord::Base
  URL_MATCHERS = {
    "youtube" => %r{youtube\.com/watch\?v=(?<id>\w+)},
    "vimeo"   => %r{}
  }

  SOURCE_MATCHERS = {
    %r{youtube} => "youtube",
    %r{vimeo}   => "vimeo"
  }

  belongs_to :category
  validates_presence_of :title, :url, :slug, :thumbnail
  mount_uploader :thumbnail, ThumbnailUploader

  before_validation :parameterize_slug


  def external_id
    @external_id ||= self.url.match(URL_MATCHERS[self.source]) { |m| m[:id] }
  end

  def source
    @source ||= begin
      if match = SOURCE_MATCHERS.find { |k, _| self.url.match(k) }
        match[1]
      end
    end
  end


  private

  def parameterize_slug
    if self.slug.present?
      self.slug = self.slug.parameterize
    else
      self.slug = self.title.parameterize
    end
  end
end
