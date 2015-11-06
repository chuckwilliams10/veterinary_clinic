class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_profile!

  def index
    @appointments = Appointment.all
    @appointments_by_date = @appointments.group_by(&:visit_date)

    respond_to do |format|
      format.html
      format.json { render json: @appointments }
    end
  end

  def new
    @pets = Pet.includes(:customer).all
    @appointment = current_user.profile.appointments.build
    @doctors = Profile.doctors

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end


  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = current_user.profile.appointments.new(validate_params)
    @pets = Pet.includes(:customer).all
    @customers = Profile.all
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @customer = @appointment.profile
    @pet = @appointment.pet if @appointment
    respond_to do |format|
      format.html
      format.json { render json: @appointment }
    end
  end

  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(validate_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def validate_params
    params.require(:appointment).permit(:visit_date, :user_id, :pet_id, :customer_id, :doctor_id, :visit_reason, :reminder)
  end

  def get_profile!
    @profile = current_user.profile
  end
end
