class Api::V1::SubscriptionsController < ApplicationController
	def index
		render json: SubscriptionsSerializer.new(Subscription.all)
	end

	def create
		subscription = Subscription.find(params[:id])
		customer = Customer.find(params[:customer_id])
		customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription )

		if customer_subscription.save
			render json: CustomerSubscriptionSerializer.new(customer_subscription), status: 201
		end
	end

	def destroy
		subscription = Subscription.find(params[:id])
		customer = Customer.find(params[:customer_id])
		customer_subscription = CustomerSubscription.find_by(customer: customer, subscription: subscription)
		customer_subscription.destroy
		render status: 204
	end
end