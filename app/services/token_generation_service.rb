# frozen_string_literal: true

# Service to handle token generation
class TokenGenerationService
  def self.generate
    SecureRandom.hex
  end
end
