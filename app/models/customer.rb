class Customer < ApplicationRecord
	has_many :customer_subscriptions
	has_many :subscriptions, through: :customer_subscriptions

	validates :email, uniqueness: true,
										presence: true,
										format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
