class Post < ApplicationRecord
  attr_accessor :tags

  ATTRS = [:title, :description, :content, :slug, :category_id, :image, :status, tags: []]

  has_one :image
  has_one_attached :image

  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :category

  has_many :comments, dependent: :destroy

  serialize :tags
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  before_save :to_slug

  def to_param
    "#{to_slug}#{id}"
  end

  private

  def to_slug
    if slug.blank?
      self.slug = self.title.to_s.parameterize
    else
      self.slug = self.slug.to_s.parameterize
    end
  end
end
