require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
	describe "relationships" do
		it { should belong_to :customer }
		it { should belong_to :subscription }
	end

	describe "find_by_customer" do
		it "returns all customer subscriptions according to customer" do
			create_list(:customer, 2)
			customer_1 = Customer.first
			customer_2 = Customer.last
			sub_1 = create(:subscription)
			sub_2 = create(:subscription)
			sub_3 = create(:subscription)
			cs_1 = CustomerSubscription.create(customer: customer_1, subscription: sub_1)
			cs_2 = CustomerSubscription.create(customer: customer_1, subscription: sub_2)
			cs_3 = CustomerSubscription.create(customer: customer_2, subscription: sub_3)

			expect(CustomerSubscription.find_by_customer(customer_1)).to match([cs_1, cs_2])
			expect(CustomerSubscription.find_by_customer(customer_2)).to match([cs_3])
		end
	end
end
