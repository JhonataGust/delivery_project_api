module V1
  module Users
    module Clients
      class OrderRelationshipsController < ApplicationController
        before_action :set_client
        before_action :set_order_relationship, only: [:update]

        def index
          @order_relationship = OrderRelationship.where(client_id: @client.id, accepted: true).order(created_at: :asc)
        end

        def update
          @order_relationship.update(order_relationship_params)

          render json: { success: 'ok' }
        end

        private

        def set_client
          @client = Client.find_by(uid: params[:uid], user_id: @user.id)
          return render json: { error: 'Client not Found' }, status: 404 if @client.nil?
        end

        def set_order_relationship
          @order_relationship = OrderRelationship.find_by(id: params[:id])
        end

        def order_relationship_params
          params.require(:order_relationship).permit(:status)
        end
      end
    end
  end
end
