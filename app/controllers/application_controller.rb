class ApplicationController < ActionController::Base

  http_basic_authenticate_with :name => "user", :password => "password"  if ENV["RAILS_ENV"] == "production"

  private

  def after_sign_in_path_for( resource)
    user_bars_path( resource)
  end
end
