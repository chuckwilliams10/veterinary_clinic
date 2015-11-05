require 'spec_helper'
describe PetsController do
  before(:each) do
    get :authenticate_user!
  end
  context 'display form to create new pet' do
    it 'loads list of pet types when display pet form' do
      get :new
      assigns(:pet_types).should == Pet.pet_types
    end

    it 'loads list of customers when display pet form' do
      customer = FactoryGirl.create(:profile)
      get :new
      assigns(:customers).should == Profile.customers
    end
  end

  context 'create new pet' do
    it 'creates pet successfully' do
      customer = FactoryGirl.create(:profile)
      post :create, FactoryGirl.attributes_for(:pet, customer: customer.id, name: 'snoopy', pet_type: "Dog", breed: 'Beagle', age: 3, weight: 2.5, date_last_visit: '2013/01/01')
      response.should be_success
    end

    it 'informs user if there is missing attribute' do
      customer = FactoryGirl.create(:profile)
      post :create, {customer: customer.id, name: nil, pet_type: "Dog", breed: nil, age: 3, weight: 12.5, last_visit: '2013/01/01' }
      assigns(:result).should == 'The following required attributes are missing: name,breed.'
    end

  end

end