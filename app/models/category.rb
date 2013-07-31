class Category < ActiveRecord::Base
  has_many :videos

  validates_presence_of :title, :key
  validates_uniqueness_of :key
end
