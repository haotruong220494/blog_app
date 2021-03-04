class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account
  # has_many :reaction, as: :reaction_refs, dependent: :destroy
  has_many :subcomments, class_name: 'Comment', foreign_key: 'comment_id', dependent: :destroy

  validates :content, presence: true

  scope :select_parent_comment, -> { where(comment_id: nil) }
  scope :select_sub_comment, ->(id) { where comment_id: id }
end
