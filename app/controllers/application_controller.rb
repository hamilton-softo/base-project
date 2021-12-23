class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private

  def not_found(exception)
    render json: { message: exception.message }, status: 404
  end

  def record_invalid(exception)
    render json: { message: exception.message }, status: 422
  end
end
