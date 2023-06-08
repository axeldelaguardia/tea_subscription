require 'rails_helper'

RSpec.describe Customer, type: :model do
	describe "relationships" do
  	it { should have_many :customer_subscriptions }
		it { should have_many(:subscriptions).through(:customer_subscriptions) }
	end

	describe "active subscriptions" do
		it "returns only active subscriptions" do 
			customer = create(:customer)
			subscriptions = create_list(:subscription, 3)
			cs = CustomerSubscription.create(customer: customer, subscription: Subscription.first, status: 0)
			CustomerSubscription.create(customer: customer, subscription: Subscription.second, status: 1)
			CustomerSubscription.create(customer: customer, subscription: Subscription.third, status: 0)

			active_subscriptions = customer.active_subscriptions
			expect(active_subscriptions).to match([Subscription.first, Subscription.third])
			expect(active_subscriptions).to_not include(Subscription.second)
			expect(active_subscriptions.count).to eq(2)

			cs.update(status: 1)

			active_subscriptions = customer.active_subscriptions
			expect(active_subscriptions).to match([Subscription.third])
			expect(active_subscriptions).to_not include(Subscription.second, Subscription.first)
			expect(active_subscriptions.count).to eq(1)
		end
	end

	describe "inactive subscriptions" do
		it "returns only inactive subscriptions" do 
			customer = create(:customer)
			subscriptions = create_list(:subscription, 3)
			cs = CustomerSubscription.create(customer: customer, subscription: Subscription.first, status: 0)
			CustomerSubscription.create(customer: customer, subscription: Subscription.second, status: 1)
			CustomerSubscription.create(customer: customer, subscription: Subscription.third, status: 0)

			inactive_subscriptions = customer.inactive_subscriptions
			expect(inactive_subscriptions).to match([Subscription.second])
			expect(inactive_subscriptions).to_not include(Subscription.first, Subscription.third)
			expect(inactive_subscriptions.count).to eq(1)

			cs.update(status: 1)

			inactive_subscriptions = customer.inactive_subscriptions
			expect(inactive_subscriptions).to match([Subscription.first, Subscription.second])
			expect(inactive_subscriptions).to_not include(Subscription.third)
			expect(inactive_subscriptions.count).to eq(2)
		end
	end
end