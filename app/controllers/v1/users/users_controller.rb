module V1
  module Users
    class UsersController < ApplicationController
      def index
        render json: {ok:'ok'}
      end

      def update
        @user.avatar.attach(user_params[:avatar]) unless user_params[:avatar] == ""
        if @user.avatar.attached?
            @user.avatar.purge if user_params[:avatar] == ""
        end
      end

      def profile
        render template: '/v1/users/users/show'
      end

      private
      def user_params
        params.require(:user).permit(:full_name, :email, :password, :phone, :avatar)
      end
    end
  end
end
