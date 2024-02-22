class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found(exeption)
        render json: {error: exeption.message}, status: :unprocessable_entity

    end

    def authorize
        @current_user = User.find_by(id: session[:user_id])

        render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
    end
end
