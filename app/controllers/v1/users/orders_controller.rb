module V1
  module Users
    class OrdersController < ApplicationController
      def index
        @orders = Order.where(user_id: @user.id)
      end

      def create
        @order = Order.create(orders_params_attributes)

        return render json: {error: @order.errors}, status: 422 if !@order.valid?
      end

      private

      def orders_params_attributes
        orders_attr = orders_params
        orders_attr[:user_id] = @user.id
        orders_attr
      end

      def orders_params
        params.require(:order).permit(:user_id, :value, orders_relationship_attributes:[:product_id, :value, :quantity])
      end
    end
  end
end
