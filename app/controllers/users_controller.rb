class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
    
    def get
        render json: User.all
    end

    def show
        render json: @current_user
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
        if @current_user.update(user_params)
            render json: @current_user, status: :ok
        else
            render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def delete
        if @current_user.destroy
            session[:user_id] = nil
            head :no_content
        else
            render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
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
