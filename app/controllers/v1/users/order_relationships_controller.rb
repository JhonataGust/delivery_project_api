module V1
  module Users
    class OrderRelationshipsController < ApplicationController
      before_action :set_order_relationship, only: [:update]

      def update
        @order_relationship.update(accepted: true, status: 1)
      end

      private

      def set_order_relationship
        @order_relationship = OrderRelationship.find_by(id:params[:id])

        return render json: { error: 'OrderRelationship not found' }, status: 404 if @order_relationship.nil?
      end
    end
  end
end
