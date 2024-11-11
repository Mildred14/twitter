# frozen_string_literal: true

class AddParentPostIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :posts, :parent_post, foreign_key: { to_table: :posts }
  end
end
