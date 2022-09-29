module V1
  module Users
    class ApplicationController < ActionController::API
      before_action :authorize

      def decode_token
          auth_header = request.headers['Authorization']

          if auth_header
            token = auth_header.split(' ')[1]
            begin
              JWT.decode(token,'secret', true, algorithm:'HS256')
            rescue JWT::DecodeError
              nil
            end
          end
      end

      def authorized_user
        @user = User.find_by(id:session[:current_user_id])
        return @user unless @user.nil?
        decoded_token = decode_token()
        if decoded_token
          user_id = decode_token[0]['user_id']
          @user = User.find_by(id: user_id)
          session[:current_user_id] = @user.id
          @user.update(session_till: Time.now + 24.hours)
          @user
        end
      end

      def authorize
        render json: {message: 'You may not have the token'}, status: :unauthorized unless authorized_user
      end
    end
  end
end
