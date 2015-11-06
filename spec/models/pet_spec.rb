require 'rails_helper'
RSpec.describe Pet, type: :model do
  let!(:pet) { FactoryGirl.create(:pet) }


  describe 'is_valid?' do
    it 'returns true for dog identifier' do
      Pet.is_valid?('dog').should be true
    end

    it 'returns true for cat identifier' do
      Pet.is_valid?('cat').should be true
    end

    it 'returns false for invalid kinds of pets' do
      Pet.is_valid?('reptiles').should be false
    end
  end

  it 'validates the presence of the customer' do
    pet.customer = nil
    lambda{
      pet.save!
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Customer can't be blank"
  end

  it 'validates the presence of age' do
    pet.age = nil
    lambda{
      pet.save!
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Age can't be blank"
  end

  it 'validates the presence of weight' do
    pet.weight = nil
    lambda{
      pet.save!
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Weight can't be blank"
  end

  it 'validates the presence of date last visit' do
    pet.date_last_visit = nil
    lambda{
      pet.save!
    }.should raise_error ActiveRecord::RecordInvalid, "Validation failed: Date last visit can't be blank"
  end
end