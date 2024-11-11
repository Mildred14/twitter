# frozen_string_literal: true

class AddLikesCountToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :likes_count, :integer, default: 0
    add_column :posts, :saves_count, :integer, default: 0
  end
end
