class Api::V1::SubscriptionsController < ApplicationController
	def index
		render json: SubscriptionsSerializer.new(Subscription.all)
	end
end