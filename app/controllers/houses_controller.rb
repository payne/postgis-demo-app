class HousesController < ApplicationController
  def create
    house = House.new house_params

    if house.save
      render json: house
    else
      render json: house.errors, status: 400
    end
  end

  def near
    lat = params[:lat]
    lng = params[:lng]

    houses = House.select_outline_geojson.near(lat, lng)

    render json: houses
  end

  def house_params
    params.require(:house).permit(:outline_geojson)
  end
end
