module V1
  module Users
    class UsersController < ApplicationController
      def index
        render json: {ok:'ok'}
      end
    end
  end
end
