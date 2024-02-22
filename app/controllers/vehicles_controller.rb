class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:destroy, :show, :update]
    def index
       render json: Vehicle.all
    end

    def show
        render json: @vehicle
    end

    def create
        vehicle = Vehicle.create!(vehicle_params)
        render json: vehicle, status: :created
    end

    def update
        @vehicle.update!(vehicle_params)
        render json: @vehicle, status: :ok
    end

    def destroy
        @vehicle.destroy
        head :no_content
    end

    private

    def set_vehicle
        @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
        params.require(:vehicle).permit(:make, :model, :year, :miles, :user_id)
    end
        
end
