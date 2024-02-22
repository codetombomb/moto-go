class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
    def get
        render json: User.all
    end

    def show
        user = User.find(session[:user_id])
        render json: user
    end

    def create
        user = User.create!(user_params)
        if user && user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        user = User.find(session[:user_id])
        if user.update(user_params)
            render json: user, status: :ok
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def delete
        user = User.find(session[:user_id])
        if user.destroy
            session[:user_id] = nil
            render json: user, status: :ok
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(
            :first_name, 
            :last_name, 
            :email, 
            :phone_number, 
            :password, 
            :password_confirmation
        )
    end
end
