module V1
  class UsersController < ApplicationController
    before_action :validate_email, only: %i[create]

    def create
      @user = User.create(user_params)

      return render json: {error: @user.errors}, status: 422 unless @user.valid?

      token = encode_token({user_id: @user.id})

      address = Address.save_city(addresses_params, @user.id)

      render json: {error: 'address city not found'} unless address

      render json: {user: @user, token: token}
    end

    def login
      @user = User.find_by(email: user_params[:email])

      if @user && @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        return render json: {error: 'Email or Password incorrect'}, status: 404
      end
    end

    private

    def validate_email
      user_exist = User.find_by(email: user_params[:email])

      return render json: {error: 'E-mail already exists'}, status: 404 unless user_exist.nil?
    end

    def user_params
      params.require(:user).permit(:full_name, :email, :password, :phone)
    end

    def addresses_params
      params.require(:address).permit(:street, :number, :complement, :district, :city)
    end
  end
end
