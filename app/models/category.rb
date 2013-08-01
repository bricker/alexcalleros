class Category < ActiveRecord::Base
  has_many :videos

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug
end
