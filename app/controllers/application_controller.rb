class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    private

    def render_invalid(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
