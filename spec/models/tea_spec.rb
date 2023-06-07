require 'rails_helper'

RSpec.describe Tea, type: :model do
	describe "relationships" do
		it { should have_many :subscription_teas }
		it { should have_many(:subscriptions).through(:subscription_teas)}
	end

	describe "validations" do
		it "validates temperature within a range" do
			tea = Tea.new(title: "Peach Tranquility", description: "Green", temperature: 165, brew_time: 10)

			expect(tea.save).to be false
			expect(tea.errors.messages[:temperature]).to eq(["must be between 170.0 and 185.0"])

			tea = Tea.new(title: "Peach Tranquility", description: "Green", temperature: 175.0, brew_time: 10)
			expect(tea.save).to be true
		end
	end
end
