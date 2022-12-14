module V1
  module Users
    module Clients
        class ProductsController < ApplicationController
            before_action :set_client, only: %i[index]
            before_action :set_product, only: %i[show update]

            def index
              @products = Product.where(client_id: @client.id).limit(50)
            end

            def create
              @product = Product.create(product_params)

              return render json: {error: 'Something went wrong'} unless @product.valid?
            end

            def show; end

            def update
              @product.image.attach(product_params[:image]) unless product_params[:image] == ""
              if @product.image.attached?
                  @product.image.purge if product_params[:image] == ""
              end

              @product.update(product_params.except(:image))
            end

            private

            def set_client
              @client = Client.find_by(uid: params[:uid])

              return render json: {error: 'Client not found'} if @client.nil?
            end

            def set_product
              @product = Product.find_by(id: params[:product_id])

              return render json: {error: 'Product not Found'} if @product.nil?
            end

            def product_params
              params.require(:product).permit(:name, :description, :value, :promotion, :client_id, :duration_estimation, :stock, :image, :product_type)
            end
        end
    end
  end
end
