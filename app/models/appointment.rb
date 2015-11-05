class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :customer, :foreign_key => 'customer_id', :class_name => 'Customer'
  belongs_to :doctor, :foreign_key => 'doctor_id', :class_name => 'Doctor'
  belongs_to :profile, :foreign_key => 'profile_id'

  validates :customer_id, :doctor_id, :pet_id, :reminder, :visit_reason, presence: true
  validate :visit_date_cannot_be_in_past

  def visit_date_cannot_be_in_past
    if !visit_date.blank? and visit_date < Date.today
      errors.add(:visit_date, "visit date should be a future date")
    end
  end
end
