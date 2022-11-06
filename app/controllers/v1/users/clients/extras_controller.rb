module V1
  module Users
    module Clients
      class ExtrasController < ApplicationController
        before_action :set_extra, only: %i[show update]

        def index
          @extras = Extra.where(params[:product_id])
        end

        def create
         return if extras_params[:extras].nil?
         extras_params[:extras].each do |extra|
           extras = Extra.create(name: extra[:name], price: extra[:value], product_id: extras_params[:product_id])
         end
        end

        private

        def extras_params
          params.require(:extra).permit(:product_id, extras:[:name, :value])
        end
      end
    end
  end
end
