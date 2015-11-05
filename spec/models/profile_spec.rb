require 'rails_helper'
RSpec.describe Profile, type: :model do

  let!(:profile) { FactoryGirl.create(:profile) }
  describe "is_valid?" do
    it "returns true for Customer profile" do
      Profile.is_valid?("Customer").should be true
    end

    it "returns true for Doctor profile" do
      Profile.is_valid?("Doctor").should be true
    end

    it "returns false for invalid profiles" do
      Profile.is_valid?("Actor").should be false
    end
  end
end