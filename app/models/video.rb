class Video < ActiveRecord::Base
  URL_MATCHERS = {
    "youtube" => %r{youtube\.com/watch\?v=(?<id>[\w-]+)},
    "vimeo"   => %r{vimeo\.com/(?<id>\d+)},
    "direct"  => %r{\.(mov|mp4|mpeg|wmv|avi)\z}i
  }

  belongs_to :category
  mount_uploader :thumbnail, ThumbnailUploader

  before_validation :parameterize_slug

  validates_presence_of :title, :slug, :thumbnail
  validate :video_url_or_embed_code_present
  validate :video_url_is_valid


  def external_id
    @external_id ||= begin
      return nil if self.url.blank?
      self.url.match(URL_MATCHERS[self.source]) { |m| m[:id] }
    end
  end

  def source
    @source ||= begin
      return "embed_code" if self.embed_code.present?
      if match = URL_MATCHERS.find { |_, v| self.url.match(v) }
        match[0]
      end
    end
  end


  private

  def video_url_or_embed_code_present
    if self.embed_code.blank? && self.url.blank?
      self.errors.add(:base, "Embed Code or URL must be present.")
    end
  end

  def video_url_is_valid
    if !self.source
      self.errors.add(:url, "is invalid. Vimeo, YouTube, or direct URLS to " \
                            ".mov, .mp4, .mpeg, .wmv, or .avi files are " \
                            "accepted.")
    end
  end

  def parameterize_slug
    if self.slug.present?
      self.slug = self.slug.parameterize
    else
      self.slug = self.title.parameterize
    end
  end
end
