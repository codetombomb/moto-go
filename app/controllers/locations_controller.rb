class LocationsController < ApplicationController
    skip_before_action :authorize

    def by_city
        cities = Location.where("city ILIKE ?", "%#{location_params[:city]}%")
        render json: cities, status: :ok    
    end

    private 

    def location_params
        params.permit(:city)
    end
end
