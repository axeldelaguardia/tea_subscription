class Api::V1::CustomerSubscriptionsController < ApplicationController
	def index
		if params[:customer_id]
			customer = Customer.find(params[:customer_id])
			render json: CustomerSubscriptionSerializer.new(CustomerSubscription.find_by_customer(customer))
		else
			render json: ErrorSerializer.no_customer, status: 404
		end
	end

	def create
		subscription = Subscription.find(customer_subscription_params[:subscription_id])
		customer = Customer.find(customer_subscription_params[:customer_id])
		customer_subscription = CustomerSubscription.new(customer: customer, subscription: subscription )

		if customer_subscription.save
			render json: CustomerSubscriptionSerializer.new(customer_subscription), status: 201
		end
	end

	def update
		customer_subscription = CustomerSubscription.find(update_params[:id])
		customer_subscription.update(status: update_params[:status])
		render json: CustomerSubscriptionSerializer.new(customer_subscription), status: 200
	end

	def destroy
		customer_subscription = CustomerSubscription.find(params[:id])
		customer_subscription.destroy
		render status: 204
	end

	private
	def customer_subscription_params
		params.require(:customer_subscription).permit(:id, :subscription_id, :customer_id, :status)
	end

	def update_params
		params.require(:customer_subscription).permit(:id, :status)
	end
end