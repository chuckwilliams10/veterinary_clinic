class Pet < ActiveRecord::Base
  TYPES  =%w[Dog Cat Bird]

  belongs_to :customer
  has_many :appointments
  belongs_to :profile, :foreign_key => 'profile_id'


  validates_presence_of :age, :breed, :customer_id, :date_last_visit, :name, :reason,:weight, :pet_type

  validates_length_of :name, :maximum => 35
  validates_length_of :breed, :maximum => 35

  def is?(pet)
    self.include?(pet.to_s)
  end

  def self.is_valid?(t)
    Pet::TYPES.include?(t.classify) unless t.blank?
  end
end
