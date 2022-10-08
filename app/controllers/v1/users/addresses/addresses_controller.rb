module V1
  module Users
    module Addresses
      class AddressesController < ApplicationController
          before_action :set_address, only: %i[update]

          def create
            @address = Address.create(set_params)

            return render json: {success: 'created with success'}, status: 200
          end

          def update
            @address.update(set_params)
          end

          def set_address
            @address =  Address.find(params[:id])
            return render json: {error: 'address not found'}, status: 422 if @address.nil?
          end

          private

          def addresses_params
            params.require(:address).permit(:street, :number, :complement, :district, :city, :user_id)
          end

          def set_params
            address_params = addresses_params
            address_params[:city_id] = get_city(addresses_params[:city])
            address_params
          end

          def get_city(city_name)
            city = City.find_by(name:city_name.split(' ')[0])
            return render json: {error:'city_not_found'},status: 422 if city.nil?
            city.id
          end
      end
    end
  end
end
