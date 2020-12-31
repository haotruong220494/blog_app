class Category < ApplicationRecord
  ATTRS = [:title, :slug]

  has_many :posts, dependent: :destroy
  validates :title, presence: true
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
