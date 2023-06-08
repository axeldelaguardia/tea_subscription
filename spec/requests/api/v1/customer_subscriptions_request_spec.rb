# require "rails_helper"

# RSpec.describe "Subscription Request" do
# 	describe "Customer Subscriptions" do
# 		context "when succesful" do
# 			it "returns all subscriptions active or inactive for a customer" do
# 				subs = create_list(:subscription, 5)
# 				customer_1 = create(:customer)
# 				customer_2 = create(:customer)
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[0])
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[1])
# 				CustomerSubscription.create(customer: customer_2, subscription: subs[2])
# 				CustomerSubscription.create(customer: customer_2, subscription: subs[3])
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[4])

# 				get api_v1_customer_subscriptions_path, params: {customer_id: customer_1.id}

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to eq([:data])
# 				expect(data[:data]).to be_an Array
# 				expect(data[:data].count).to eq(3)
# 				data[:data].each do |customer_subscription|
# 					expect(customer_subscription).to be_a Hash
# 					expect(customer_subscription.keys).to match([:id, :type, :attributes])
# 					expect(customer_subscription[:id]).to be_a String
# 					expect(customer_subscription[:type]).to be_a String
# 					expect(customer_subscription[:attributes]).to be_a Hash
# 					expect(customer_subscription[:attributes].keys).to match([:customer_id, :subscription])
# 					expect(customer_subscription[:attributes][:customer_id]).to be_an Integer
# 					expect(customer_subscription[:attributes][:subscription]).to be_a Hash
# 					expect(customer_subscription[:attributes][:subscription].keys).to include(:title, :price, :status, :frequency)
# 					expect(customer_subscription[:attributes][:subscription][:title]).to be_a String
# 					expect(customer_subscription[:attributes][:subscription][:price]).to be_a Float
# 					expect(customer_subscription[:attributes][:subscription][:status]).to be_a String
# 					expect(customer_subscription[:attributes][:subscription][:frequency]).to be_a Integer
# 				end
# 			end
# 		end

# 		context "when unsuccesful" do
# 			it "returns all subscriptions active or inactive for a customer" do
# 				subs = create_list(:subscription, 5)
# 				customer_1 = create(:customer)
# 				customer_2 = create(:customer)
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[0])
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[1])
# 				CustomerSubscription.create(customer: customer_2, subscription: subs[2])
# 				CustomerSubscription.create(customer: customer_2, subscription: subs[3])
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[4])

# 				get api_v1_customer_subscriptions_path, params: {customer_id: 7}

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:status]).to eq("404")
# 					expect(error[:title]).to be_a String
# 					expect(error[:title]).to eq("Couldn't find Customer with 'id'=7")
# 				end
# 			end

# 			it "returns all subscriptions active or inactive for a customer" do
# 				subs = create_list(:subscription, 5)
# 				customer_1 = create(:customer)
# 				customer_2 = create(:customer)
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[0])
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[1])
# 				CustomerSubscription.create(customer: customer_2, subscription: subs[2])
# 				CustomerSubscription.create(customer: customer_2, subscription: subs[3])
# 				CustomerSubscription.create(customer: customer_1, subscription: subs[4])

# 				get api_v1_customer_subscriptions_path

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:status]).to eq("404")
# 					expect(error[:title]).to be_a String
# 					expect(error[:title]).to eq("Customer ID must be provided to find subscriptions.")
# 				end
# 			end
# 		end
# 	end

# 	describe "create subscription" do
# 		context "when successful" do
# 			it "creates a subscription to the customer" do
# 				sub = create(:subscription)
# 				customer =  create(:customer)

# 				customer_subscription_params = {
# 																					customer_id: customer.id,
# 																					subscription_id: sub.id
# 																			  }

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data).to have_key(:data)
# 				expect(data[:data]).to be_a Hash
# 				expect(data[:data].keys).to match([:id, :type, :attributes])
# 				expect(data[:data][:id]).to be_an String
# 				expect(data[:data][:type]).to be_a String
# 				expect(data[:data][:attributes]).to be_a Hash
# 				expect(data[:data][:attributes].keys).to match([:customer_id, :subscription])
# 				expect(data[:data][:attributes][:customer_id]).to be_an Integer
# 				expect(data[:data][:attributes][:subscription]).to be_a Hash
# 				expect(data[:data][:attributes][:subscription].keys).to include(:title, :price, :status, :frequency)
# 				expect(data[:data][:attributes][:subscription][:title]).to be_a String
# 				expect(data[:data][:attributes][:subscription][:price]).to be_a Float
# 				expect(data[:data][:attributes][:subscription][:status]).to be_a String
# 				expect(data[:data][:attributes][:subscription][:frequency]).to be_a Integer
# 			end
# 		end

# 		context "when unsuccessful" do
# 			it "user doesn't exist" do
# 				sub = create(:subscription)

# 				customer_subscription_params = {
# 					customer_id: 35,
# 					subscription_id: sub.id
# 				}

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:title]).to be_a String
# 				end
# 			end

# 			it "subscription doesn't exist" do
# 				customer = create(:customer)

# 				customer_subscription_params = {
# 					customer_id: customer.id,
# 					subscription_id: 7
# 				}

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:title]).to be_a String
# 				end
# 			end

# 			it "no subscription sent" do
# 				customer = create(:customer)

# 				customer_subscription_params = {
# 					customer_id: customer.id
# 				}

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:status]).to eq("404")
# 					expect(error[:title]).to be_a String
# 					expect(error[:title]).to eq("Couldn't find Subscription without an ID")
# 				end
# 			end

# 			it "no customer sent" do
# 				sub = create(:subscription)

# 				customer_subscription_params = {
# 					subscription_id: sub.id
# 				}

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:status]).to eq("404")
# 					expect(error[:title]).to be_a String
# 					expect(error[:title]).to eq("Couldn't find Customer without an ID")
# 				end
# 			end

# 			it "incorrect data type sent as subscription" do
# 				customer = create(:customer)

# 				customer_subscription_params = {
# 					customer_id: customer.id,
# 					subscription_id: "starter"
# 				}

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:status]).to eq("404")
# 					expect(error[:title]).to be_a String
# 					expect(error[:title]).to eq("Couldn't find Subscription with 'id'=starter")
# 				end
# 			end

# 			it "incorrect data type sent as customer" do
# 				sub = create(:subscription)

# 				customer_subscription_params = {
# 					customer_id: "alex",
# 					subscription_id: sub.id
# 				}

# 				headers = { "Content-Type" => "application/json"}

# 				post api_v1_customer_subscriptions_path, headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:status]).to eq("404")
# 					expect(error[:title]).to be_a String
# 					expect(error[:title]).to eq("Couldn't find Customer with 'id'=alex")
# 				end
# 			end
# 		end
# 	end

# 	describe "cancel subscription" do
# 		context "when successful" do
# 			it "removes the subscription from the customer" do
# 				sub = create(:subscription)
# 				customer = create(:customer)
# 				customer_subscription = CustomerSubscription.create(customer: customer, subscription: sub)

# 				delete api_v1_customer_subscription_path(customer_subscription.id)

# 				expect(response.status).to eq(204)
# 			end
# 		end

# 		context "when unsuccessful" do
# 			it "customer subscription doesn't exist" do
# 				delete api_v1_customer_subscription_path(3)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(response.status).to eq(404)

# 				expect(data).to be_a Hash
# 				expect(data.keys).to match([:message, :errors])
# 				expect(data[:message]).to be_a String
# 				expect(data[:errors]).to be_an Array
# 				data[:errors].each do |error|
# 					expect(error.keys).to match([:status, :title])
# 					expect(error[:status]).to be_a String
# 					expect(error[:title]).to be_a String
# 				end
# 			end
# 		end
# 	end

# 	describe "update the status (cancel) of a customer subscription" do
# 		context "when successful" do
# 			it "updates the status of a customer subscription to inactive" do
# 				create_list(:customer, 2)
# 				create_list(:subscription, 3)
# 				cs_1 = CustomerSubscription.create(customer: Customer.first, subscription: Subscription.first)
# 				cs_2 = CustomerSubscription.create(customer: Customer.first, subscription: Subscription.second)
# 				cs_2 = CustomerSubscription.create(customer: Customer.second, subscription: Subscription.third)

# 				headers = { "Content-Type" => "application/json" }
# 				body = {
# 					id: cs_1.id,
# 					status: 1
# 				}

# 				patch api_v1_customer_subscription_path(cs_1), headers: headers, params: JSON.generate(customer_subscription: body)

# 				data = JSON.parse(response.body, symbolize_names: true)

# 				expect(data).to be_a Hash
# 				expect(data).to have_key(:data)
# 				expect(data[:data]).to be_a Hash
# 				expect(data[:data].keys).to match([:id, :type, :attributes])
# 				expect(data[:data][:id]).to be_a String
# 				expect(data[:data][:type]).to be_a String
# 				expect(data[:data][:attributes]).to be_a Hash
# 				expect(data[:data][:attributes].keys).to match([:customer_id, :subscription])
# 				expect(data[:data][:attributes][:customer_id]).to be_an Integer
				
# 				subscription = data[:data][:attributes][:subscription]
# 				expect(subscription).to be_a Hash
# 				expect(subscription.keys).to match([:id, :title, :price, :status, :frequency, :created_at, :updated_at])
# 				expect(subscription[:id]).to be_an Integer
# 				expect(subscription[:title]).to be_a String
# 				expect(subscription[:price]).to be_a Float
# 				expect(subscription[:status]).to be_a String
# 				expect(subscription[:frequency]).to be_a Integer
# 				expect(subscription[:created_at]).to be_a String
# 				expect(subscription[:updated_at]).to be_a String
# 			end
# 		end
# 	end
# end