require 'rails_helper'

RSpec.describe Discount, type: :model do
  it "has a valid factory" do
    user = FactoryBot.create :user
    expect(user).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    let(:user) { FactoryBot.create(:user) }

    it "should has many user roles" do
    end

    it "should has many user roles" do
    end

    it "should has many user roles" do
    end

    it "should has many user roles" do
    end

    it "should has many user roles" do
    end
  end
end
