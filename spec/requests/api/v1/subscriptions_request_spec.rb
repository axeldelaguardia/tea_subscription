require "rails_helper"

RSpec.describe "Subscription Request" do
	describe "Subscription Index" do
		context "when succesful" do
			it "returns all subscriptions active or inactive" do
				create_list(:subscription, 5)

				get api_v1_subscriptions_path

				data = JSON.parse(response.body, symbolize_names: true)

				expect(data).to be_a Hash
				expect(data.keys).to eq([:data])
				expect(data[:data]).to be_an Array
				data[:data].each do |subscription|
					expect(subscription).to be_a Hash
					expect(subscription.keys).to match([:id, :type, :attributes])
					expect(subscription[:id]).to be_a String
					expect(subscription[:type]).to be_a String
					expect(subscription[:attributes]).to be_a Hash
					expect(subscription[:attributes].keys).to match([:title, :price, :status, :frequency])
					expect(subscription[:attributes][:title]).to be_a String
					expect(subscription[:attributes][:price]).to be_a Float
					expect(subscription[:attributes][:status]).to be_a String
					expect(subscription[:attributes][:frequency]).to be_a Integer
				end
			end
		end
	end

	describe "create subscription" do
		context "when successful" do
			it "creates a subscription to the customer" do
				sub = create(:subscription)
				customer =  create(:customer)

				post api_v1_subscriptions_path, params: {id: sub.id, customer_id: customer.id}

				data = JSON.parse(response.body, symbolize_names: true)

				expect(data).to be_a Hash
				expect(data).to have_key(:data)
				expect(data[:data]).to be_a Hash
				expect(data[:data].keys).to match([:id, :type, :attributes])
				expect(data[:data][:id]).to be_an String
				expect(data[:data][:type]).to be_a String
				expect(data[:data][:attributes]).to be_a Hash
				expect(data[:data][:attributes].keys).to match([:customer_id, :subscription_id])
				expect(data[:data][:attributes][:customer_id]).to be_an Integer
				expect(data[:data][:attributes][:subscription_id]).to be_an Integer
			end
		end

		context "when unsuccessful" do
			it "user doesn't exist" do
				sub = create(:subscription)

				post api_v1_subscriptions_path, params: {id: sub.id, customer_id: 35}

				data = JSON.parse(response.body, symbolize_names: true)

				expect(data).to be_a Hash
				expect(data.keys).to match([:message, :errors])
				expect(data[:message]).to be_a String
				expect(data[:errors]).to be_an Array
				data[:errors].each do |error|
					expect(error.keys).to match([:status, :title])
					expect(error[:status]).to be_a String
					expect(error[:title]).to be_a String
				end
			end
			
			it "subscription doesn't exist" do
				customer = create(:customer)

				post api_v1_subscriptions_path, params: {id: 2, customer_id: customer.id}

				data = JSON.parse(response.body, symbolize_names: true)

				expect(data).to be_a Hash
				expect(data.keys).to match([:message, :errors])
				expect(data[:message]).to be_a String
				expect(data[:errors]).to be_an Array
				data[:errors].each do |error|
					expect(error.keys).to match([:status, :title])
					expect(error[:status]).to be_a String
					expect(error[:title]).to be_a String
				end
			end
		end
	end

	describe "cancel subscription" do
		context "when successful" do
			it "removes the subscription from the customer" do
				sub = create(:subscription)
				customer = create(:customer)
				customer_subscription = CustomerSubscription.create(customer: customer, subscription: sub)

				delete api_v1_subscription_path(sub.id), params: {customer_id: customer.id}

				expect(response.status).to eq(204)
			end
		end
	end
end