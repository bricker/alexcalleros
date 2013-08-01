class Category < ActiveRecord::Base
  has_many :videos

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug

  before_validation :parameterize_slug
  before_save :set_position, if: -> { self.position.blank? }

  private

  def set_position
    self.position = Category.order("position")
    .where("id != ?", self.id).last.position + 1
  end

  def parameterize_slug
    if self.slug.present?
      self.slug = self.slug.parameterize
    else
      self.slug = self.title.parameterize
    end
  end
end
