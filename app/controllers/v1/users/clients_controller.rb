module V1
  module Users
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[show update]

      def index
        query = params[:term] == 'user' ? Client.where(user_id: @user.id) : Client.all.limit(200)
        @clients = query

      end
      def show
      end

      def create
        @client = Client.create(clients_params_attributes)

        return render json:{error: @client.errors}, status: 422 unless @client.valid?
      end

      def update
        @client.update(clients_params_attributes)

        return render json:{error: @client.errors}, status: 422 if @client.valid?
      end

      private

      def clients_params_attributes
        clients_params_attr = clients_params
        clients_params_attr[:company_relevance] = 0
        clients_params_attr[:user_id] = @user.id
        clients_params_attr
      end

      def clients_params
        params.require(:client).permit(:company_name,:short_name,:company_relevance,:user_id,:number,:email,:description, :open, :close, :contact)
      end

      def set_client
        @client = Client.find_by(id: params[:id])

        return render json: {error: 'Client not Found'}, status: 404
      end
    end
  end
end
