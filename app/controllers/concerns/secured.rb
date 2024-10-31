# frozen_string_literal: true

# Concern to handle auth
module Secured
  def authenticate_user!
    return if (Current.user = user_from_token)

    render json: { error: 'Unauthorized' }, status: :unauthorized
  rescue JWT::VerificationError, JWT::DecodeError, StandardError
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def user_from_token
    token = token_from_auth_header
    payload = JsonWebToken.verify(token).first.with_indifferent_access
    return unless payload.present?

    User.find_or_create_by(email: payload[:email]) do |user|
      user.name = payload[:name]
    end
  end

  def token_from_auth_header
    # Bearer xxxxxx
    token_regex = /Bearer (.+)/
    # leer HEADER de auth
    headers = request.headers
    return unless headers['Authorization'].present? && headers['Authorization'].match(token_regex)

    headers['Authorization'].match(token_regex)[1]
  end
end
