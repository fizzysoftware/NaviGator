class ApplicationController < ActionController::Base

  http_basic_authenticate_with :name => "user", :password => "password"  if ENV["RAILS_ENV"] == "production"

  private

  def after_sign_in_path_for( resource)
    user_bars_path( resource)
  end

  def ensure_current_user( _user )
    if( _user != current_user )
      redirect_to( user_bars_path( current_user ), alert: 'Unauthorized Access' )
      return
    end
  end

end
