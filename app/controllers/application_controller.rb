class ApplicationController < ActionController::Base

  # http_basic_authenticate_with :name => "user", :password => "password"  if ENV["RAILS_ENV"] == "production"

  before_filter :reroute_signed_in_user

  private

  def after_sign_in_path_for( resource)
    resource.is_a?( User ) ? user_bars_path( resource) : super
  end

  def ensure_current_user( _user )
    if( _user != current_user )
      redirect_to( user_bars_path( current_user ), alert: 'Unauthorized Access' )
      return
    end
  end

  def reroute_signed_in_user
    redirect_to user_bars_path( current_user ) and return if ( current_user && request.url == root_url )
  end

end
