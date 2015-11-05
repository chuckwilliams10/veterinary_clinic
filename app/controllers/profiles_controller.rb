class ProfilesController < ApplicationController
  load_and_authorize_resource

  def new
    unless current_user.profile
      @profile = current_user.build_profile
      @profile.type = params[:type] || "Customer"

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    else
      redirect_to current_user.profile
    end

  end
end
