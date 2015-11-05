class Doctor < Profile
  belongs_to :user
  has_many :appointments
end
