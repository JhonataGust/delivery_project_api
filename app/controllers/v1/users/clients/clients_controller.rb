module V1
  module Users
    module Clients
      class ClientsController < ApplicationController
        before_action :set_client, only: %i[show update]

        def index
          @clients = Client.make_param(params[:term], @user.id)
        end
        def show
        end

        def category
          query = Client.where('company_relevance >= 4.5') if params[:term] == 'more_evaluated'
          query = Client.where('company_relevance >= 3') if params[:term] == 'more_relevant'
        end

        def create
          @client = Client.create(clients_params_attributes)

          return render json:{error: @client.errors}, status: 422 unless @client.valid?

          notify_email(@client)
        end

        def update
          @client.logo.attach(clients_params[:logo]) unless clients_params[:logo] == ""

          if clients_params[:logo].blank? && @client.logo.attached?
            @client.logo.purge
          end

          @client.update(clients_params_attributes.except(:logo))

          return render json:{error: @client.errors}, status: 422 unless @client.valid?
        end

        private

        def notify_email(client)
            ClientsMailer.with(
              client: client,
              user: @user
            ).confirmation.deliver_later
        end

        def clients_params_attributes
          clients_params_attr = clients_params
          clients_params_attr[:user_id] = @user.id
          clients_params_attr
        end

        def clients_params
          params.require(:client).permit(:company_name,:short_name,:company_relevance,:user_id,:number,:email,:description, :open, :close, :contact, :logo)
        end

        def set_client
          @client = Client.find_by(id: params[:id])
          @client = Client.find_by(uid: params[:id]) if @client.nil?

          return render json: {error: 'Client not Found'}, status: 404 if @client.nil?
        end
      end
    end
  end
end
