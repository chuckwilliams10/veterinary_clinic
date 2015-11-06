FactoryGirl.define do
  factory :profile do
    profile_type 'Customer'
    name 'Chris'
    address 'MyString'
    city 'MyString'
    state 'MyString'
    zipcode 'MyString'
    school 'MyString'
    years_practice 1
  end

end
