require "rails_helper"

RSpec.describe "Subscription Request" do
	describe "Subscription Index" do
		context "when succesful" do
			it "returns all subscriptions active or inactive" do
				create_list(:subscription, 5)

				get api_v1_subscriptions_path

				require 'pry'; binding.pry
			end
		end
	end
end