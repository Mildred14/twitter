# frozen_string_literal: true

module Reactions
  class Save < Reaction
    belongs_to :post, counter_cache: :saves_count
  end
end
