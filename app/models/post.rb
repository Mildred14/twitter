# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :parent_post, class_name: 'Post', optional: true
  has_many :comments, class_name: 'Post', foreign_key: :parent_post_id
  has_many :likes, class_name: 'Reactions::Like'
  has_many :saves, class_name: 'Reactions::Save'

  validates :content, presence: true

  scope :sorted, -> { order(created_at: :desc) }
end
