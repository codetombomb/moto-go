class ApplicationController < ActionController::API
    include ActionController::Cookies
    before_action :authorize
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    private

    def record_not_found(exeption)
        render json: {errors: exeption.message}, status: :unprocessable_entity
    end

    def record_invalid(exeption)
        render json: {errors: exeption.record.errors.full_messages}, status: :unprocessable_entity
    end

    def authorize
        @current_user = User.find_by(id: session[:user_id])
        render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
    end
end
