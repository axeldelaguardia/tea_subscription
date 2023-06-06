class Subscription < ApplicationRecord
	enum status: [ :inactive, :active ]
	has_many :customer_subscriptions
	has_many :customers, through: :customer_subscriptions
end
