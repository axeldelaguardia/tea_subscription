class Subscription < ApplicationRecord
	enum status: [ :inactive, :active ]
	has_many :customer_subscriptions
	has_many :customers, through: :customer_subscriptions
	has_many :subscription_teas
	has_many :teas, through: :subscription_teas

	def self.customer_subscriptions(customer_id)
		Subscription.joins(:customer_subscriptions).where(customer_subscriptions: {customer_id: customer_id})
	end
end
