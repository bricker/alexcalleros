class Category < ActiveRecord::Base
  has_many :videos

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug

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
