class Video < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title, :url
  mount_uploader :thumbnail, ThumbnailUploader

  before_validation :parameterize_slug



  private

  def parameterize_slug
    if self.slug.present?
      self.slug = self.slug.parameterize
    else
      self.slug = self.title.parameterize
    end
  end
end
