require 'rails_helper'

RSpec.describe Discount, type: :model do
  it "has a valid factory" do
    user = FactoryBot.create :car_model
    expect(car_model).to be_persisted
    byebug
  end
end
