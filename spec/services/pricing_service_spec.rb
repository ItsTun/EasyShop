require "rails_helper"

describe PricingService do
  it 'will create pricings' do
    result = PricingService.new.call
    expect(Pricing.count).to be > 0
  end
end