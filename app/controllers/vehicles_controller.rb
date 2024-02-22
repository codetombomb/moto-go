class VehiclesController < ApplicationController
    def index
       render json: Vehicle.all
    end

    def show
        render json: Vehicle.find(params[:id])
    end

    def create
        vehicle = Vehicle.create!(vehicle_params)
        render json: vehicle, status: :created
    end

    def update
        vehicle = Vehicle.find(params[:id])
        vehicle.update!(vehicle_params)
        render json: vehicle, status: :ok
    end

    def destroy
        vehicle = Vehicle.find(params[:id])
        debugger
        vehicle.destroy
        render json: {}, status: :ok
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:make, :model, :year, :miles, :user_id)
    end
        
end
