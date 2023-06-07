class Tea < ApplicationRecord
	has_many :subscription_teas
	has_many :subscriptions, through: :subscription_teas
	validate :valid_temperature

	def valid_temperature
		errors.add(:temperature, 'must be between 170.0 and 185.0') unless temperature&.between?(170.0, 185.0)
	end
end
