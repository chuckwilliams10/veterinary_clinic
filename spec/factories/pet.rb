FactoryGirl.define do
  factory :pet do
    association :customer, factory: :profile
    name "tommy"
    pet_type "dog"
    breed "Bull dog"
    age 4
    weight "12"
    date_last_visit "2015-11-01 16:05:08"
    reason "MyText"
  end

end
