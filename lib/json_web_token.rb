# https://medium.com/@goncalvesjoao/rails-devise-jwt-and-the-forgotten-warden-67cfcf8a0b73#.yiepnc2yq
module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        return fail! unless claims
        return fail! unless claims.has_key?('user_id')

        success! User.find_by_id claims['user_id']
      end

      protected ######################## PROTECTED #############################

      def claims
        strategy, token = request.headers['Authorization'].split(' ')

        return nil if (strategy || '').downcase != 'bearer'

        JWTWrapper.decode(token) rescue nil
      end
    end
  end
end

# Helper module for you to use on your app and in your Strategy
# Don't add "Helper" to its name and rails won't load it has a view helper module.
# "app/helpers/jwt_wrapper.rb"

module JWTWrapper
  extend self

  def encode(payload, expiration = nil)
  # def encode(payload, expiration = 24.hours.from_now)
    expiration ||= Rails.application.secrets.jwt_expiration_hours

    payload = payload.dup
    payload['exp'] = expiration.to_i.hours.from_now.to_i

    JWT.encode(payload, Rails.application.secrets.jwt_secret)
  end

  def decode(token)
    begin
      decoded_token = JWT.decode(token, Rails.application.secrets.jwt_secret)

      decoded_token.first
    rescue
      nil
    end
  end
end