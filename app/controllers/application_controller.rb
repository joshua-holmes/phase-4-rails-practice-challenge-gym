class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid


    def record_not_found e
        render json: { error: e.message }, status: :not_found
    end
    def record_invalid e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
