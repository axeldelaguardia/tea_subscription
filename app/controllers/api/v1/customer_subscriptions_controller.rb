class Api::V1::CustomerSubscriptionsController < ApplicationController
	def index
		if params[:customer_id]
			customer = Customer.find(params[:customer_id])
			render json: SubscriptionsSerializer.new(Subscription.customer_subscriptions(customer.id))
		else
			render json: ErrorSerializer.no_customer, status: 404
		end
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
		customer_subscription = CustomerSubscription.find(params[:id])
		customer_subscription.destroy
		render status: 204
	end
end