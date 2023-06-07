class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :error_response

	def error_response(exception)
		error_serializer = ErrorSerializer.new(exception)
		render json: error_serializer.error, status: error_serializer.status
	end
end
