class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private
  def profile_exists?
    if current_user
      @profile = current_user.profile
      if @profile.nil?
        redirect_to :controller => :profile, :action => :new, :type => 'Customer'
      end
    end
  end
end
