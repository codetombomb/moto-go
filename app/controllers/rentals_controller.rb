class RentalsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]
    before_action :set_rental, only: [:show, :update, :destroy]

    def index
        render json: Rental.all
    end

    def show
        render json: @rental
    end

    def create
        rental = Rental.create!(rental_params)
        if rental && rental.valid?
            render json: rental, status: :created
        else
            render json: {errors: rental.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        if @rental.update(rental_params)
            render json: @rental, status: :ok
        else
            render json: {errors: @rental.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        if @rental.destroy
            head :no_content
        else
            render json: {errors: @rental.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def set_rental
        @rental = Rental.find(params[:id])
    end

    def rental_params
        params.require(:rental).permit(
            :user_id, 
            :vehicle_id, 
            :cost_per_day, 
            :start_date, 
            :end_date, 
            :description
        )
    end
end
