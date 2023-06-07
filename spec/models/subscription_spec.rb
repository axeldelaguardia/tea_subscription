require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "relationships" do
		it { should have_many :customer_subscriptions }
		it { should have_many(:customers).through(:customer_subscriptions) }
  end

	describe "customer subscriptions" do
		it "returns subscriptions tied to a specific customer" do
			create_list(:customer, 2)
			customer_1 = Customer.first
			customer_2 = Customer.last
			sub_1 = create(:subscription)
			sub_2 = create(:subscription)
			sub_3 = create(:subscription)
			CustomerSubscription.create(customer: customer_1, subscription: sub_1)
			CustomerSubscription.create(customer: customer_1, subscription: sub_2)
			CustomerSubscription.create(customer: customer_2, subscription: sub_3)

			expect(Subscription.customer_subscriptions(customer_1.id)).to match([sub_1, sub_2])
			expect(Subscription.customer_subscriptions(customer_2.id)).to match([sub_3])
		end
	end
end
