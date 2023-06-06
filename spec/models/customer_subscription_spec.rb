require 'rails_helper'

RSpec.describe CustomerSubscription, type: :model do
  it { should belong_to :customer }
  it { should belong_to :subscription }
end
