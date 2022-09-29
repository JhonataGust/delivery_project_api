module V1
  class CitiesController < ApplicationController
      def index
        @cities = if params[:term]
          City.where("name LIKE ?", "%" + params[:term] + "%").limit(15)
        end
      end
    end
end
