# frozen_string_literal: true

# :nodoc:
class HealthController < ApplicationController
  def health
    render json: { api: 'OK' }, status: :ok
  end
end
