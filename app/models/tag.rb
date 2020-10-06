class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  ATTRS = %i(name)
  validates :name, presence: true
end
