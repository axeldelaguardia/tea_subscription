class Api::V1::Customers::SubscriptionsController < ApplicationController
	def index
		customer = Customer.find(params[:customer_id])
		render json: CustomerSubscriptionSerializer.new(CustomerSubscription.find_by_customer(customer))
	end

	def create
		subscription = Subscription.find(subscription_params[:id])
		customer = Customer.find(params[:customer_id])
		customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription )

		if customer_subscription.save
			render json: SubscriptionsSerializer.new(subscription), status: 201
		end
	end

	def update
		customer = Customer.find(params[:customer_id])
		subscription = Subscription.find(params[:id])
		customer_subscription = CustomerSubscription.find_by(customer: customer, subscription: subscription)
		customer_subscription.update(status: update_params[:status])
		render json: CustomerSubscriptionSerializer.new(customer_subscription), status: 200
	end

	private
	def subscription_params
		params.require(:subscription).permit(:id)
	end

	def update_params
		params.require(:subscription).permit(:status)
	end
end