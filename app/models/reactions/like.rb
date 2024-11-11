# frozen_string_literal: true

module Reactions
  class Like < Reaction
    belongs_to :post, counter_cache: :likes_count
  end
end
