class PetsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_profile!

  def index
    @pets = @profile.pets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  def show
    @pet = @profile.pets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet }
    end
  end

  def new
    @pet = @profile.pets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  def edit
    @pet = @profile.pets.find(params[:id])
  end

  def create
    @pet = @profile.pets.new(req_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pet = @profile.pets.find(params[:id])

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet = @profile.pets.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end

  private
  def get_profile!
    @profile = current_user.profile
  end
  def req_params
    params.require(:pet).permit(:age, :breed, :customer_id, :date_last_visit, :name, :reason, :pet_type, :weight)
  end

end
