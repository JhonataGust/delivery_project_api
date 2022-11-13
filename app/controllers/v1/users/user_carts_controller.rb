module V1
  module Users
    class UserCartsController < ApplicationController
      before_action :set_user_cart, only: %i[destroy]

      def index
        @user_carts = UserCart.where(user_id: @user.id)

        @extras = Extra.where(id: @user_carts.map(&:extra_ids))
      end

      def create
        @user_cart = UserCart.create(user_cart_params_attributes)
      end

      def destroy
        @user_cart.destroy
      end

      def set_user_cart
        @user_cart = UserCart.find_by(id: params[:id])

        return render json: { error: 'UserCart not Found' }, status: 404 if @user_cart.nil?
      end

      private

      def user_cart_params_attributes
        user_cart_params_attr = user_cart_params
        user_cart_params_attr[:user_id] = @user.id
        user_cart_params_attr
      end

      def user_cart_params
        params.require(:user_cart).permit(:product_id, extra_ids: [])
      end
    end
  end
end
