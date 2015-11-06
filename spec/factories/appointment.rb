FactoryGirl.define do
  factory :appointment do
    visit_date '2015-11-01 16:07:55'
    pet_id 1
    reminder false
    visit_reason 'check up'
    doctor_id 1
  end

end
