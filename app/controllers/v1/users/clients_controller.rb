module V1
  module Users
    class ClientsController < ApplicationController
      before_action :set_client, only: %i[show update]

      def index
        @clients = Client.all.limit(200)
      end
      def show
      end

      def create
        @client = Client.create(clients_params)
      end

      def update
        @client.update(clients_params)
      end

      private

      def clients_params
        params.require(:clients).permit(:company_name,:short_name,:company_relevance,:user_id,:number,:email,:description)
      end

      def set_client
        @client = Client.find_by(id: params[:id])

        return render json: {error: 'Client not Found'}, status: 404
      end
    end
  end
end
