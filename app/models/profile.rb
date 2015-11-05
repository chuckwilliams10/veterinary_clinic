class Profile < ActiveRecord::Base
VALUES = %w[Owner Doctor Receptionist Customer]

has_many :pets # only for customer
has_many :appointments # only for customer

validates :address, presence: true
self.inheritance_column = nil

validates :name, presence:true, length: { maximum: 35 }
validates :years_practice, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, if: :is_doctor?

scope :owner, -> {
  where(:profile_type => 'Owner')
}
scope :doctors, -> {
  where(:profile_type => 'Doctor')
}
scope :receptionist, -> {
  where(:profile_type => 'Receptionist')
}
scope :customer, -> {
  where(:profile_type => 'Customer')
}
validates_format_of :profile_type, :without => /Profile/

def is_doctor?
  self.profile_type == "Doctor"

end

def self.profile_types
  Profile::VALUES
end
  def self.is_valid?(t)
  Profile::VALUES.include?(t.classify) unless t.blank?
  end
 end