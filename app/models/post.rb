class Post < ApplicationRecord
  attr_accessor :tags

  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :category

  ATTRS = [:title, :description, :content, :slug, :category_id, tags: []]
  serialize :tags
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  before_save :to_slug

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
