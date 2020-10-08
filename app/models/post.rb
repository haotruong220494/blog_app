class Post < ApplicationRecord
  before_save :to_slug

  has_many :taggings
  has_many :tags, through: :taggings

  ATTRS = [:title, :description, :content, :slug, tags: []]
  serialize :tags, Array
  validates :title, :description, presence: true

  def to_param
    "#{id}-#{to_slug}"
  end

  def to_slug
    if slug.blank?
      self.slug = self.title.to_s.parameterize
    else
      self.slug = self.slug.to_s.parameterize
    end
  end
end
