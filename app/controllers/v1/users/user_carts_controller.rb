module V1
  module Users
    class UserCartsController < ApplicationController
      def index
        @user_carts = UserCart.where(user_id: @user.id)

        @extras = Extra.where(id: @user_carts.map(&:extra_ids))
      end

      def create
        @user_cart = UserCart.create(user_cart_params_attributes)
      end

      private

      def user_cart_params_attributes
        user_cart_params_attr = user_cart_params
        user_cart_params_attr[:user_id] = @user.id
        user_cart_params_attr
      end

      def user_cart_params
        params.require(:user_cart).permit(:product_id, extra_ids:[])
      end
    end
  end
end
