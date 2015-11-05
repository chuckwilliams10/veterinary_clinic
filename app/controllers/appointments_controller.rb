class AppointmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_profile!

  def index
    @appointments = current_user.profile.appointments
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
    @appointment = current_user.profile.appointments.find(params[:id])
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
    @customer = current_user.profile
    @appointment = @customer.appointments.find(params[:id])

    @pet = Pet.find(@appointment.pet_id) if @appointment
    respond_to do |format|
      format.html
      format.json { render json: @appointment }
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
