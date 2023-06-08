class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription
	enum :status, [ :active, :inactive ], default: :active

	def self.find_by_customer(customer)
		CustomerSubscription.where(customer: customer)
	end
end
