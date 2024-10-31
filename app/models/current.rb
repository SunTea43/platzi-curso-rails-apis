# frozen_string_literal: true

# Concern for current user
class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
