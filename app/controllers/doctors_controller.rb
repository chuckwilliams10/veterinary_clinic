class DoctorsController < ApplicationController
  respond_to :json, :html
  def index
    @doctors = Profile.doctors
  end
end

