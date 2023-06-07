class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

	def self.find_by_customer(customer)
		CustomerSubscription.where(customer: customer)
	end
end
