module V1
  module Users
    class ClientsController < ApplicationController
      def index
        render json: {ok:'ok'}
      end
    end
  end
end
