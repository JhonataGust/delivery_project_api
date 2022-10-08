class Address < ApplicationRecord
  belongs_to :city
  belongs_to :user

  def self.save_city(params,user_id)
    city = City.find_by(name:params[:city].split(' ')[0])
    return false if city.nil?

  address = Address.create(
          city_id: city.id,
          street: params[:street],
          number: params[:number],
          user_id: user_id,
          complement: params[:complement],
          district: params[:district]
        )
      end
end
