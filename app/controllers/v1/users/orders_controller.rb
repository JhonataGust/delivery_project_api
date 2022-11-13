module V1
  module Users
    class OrdersController < ApplicationController
      def index
        @orders = Order.where(user_id: @user.id)
      end

      def create
        @order = Order.create(orders_params_attributes.except(:orders_relationship_attributes))

        return render json: { error: @order.errors }, status: 422 unless @order.valid?

        orders_params_attributes[:orders_relationship_attributes].each do |order_relationship|
          OrderRelationship.create(
            product_id: order_relationship[:product_id],
            quantity: order_relationship[:quantity],
            value: order_relationship[:value],
            order_id: @order.id,
            accepted: false,
            client_id: Product.find_by(id: order_relationship[:product_id]).client_id,
            extra_ids: order_relationship[:extra_ids]
          )
        end
      end

      private

      def orders_params_attributes
        orders_attr = orders_params
        orders_attr[:user_id] = @user.id
        orders_attr
      end

      def orders_params
        params.require(:order).permit(:user_id, :value, :delivery,
                                      orders_relationship_attributes: [:product_id, :value, :quantity, { extra_ids: [] }])
      end
    end
  end
end
