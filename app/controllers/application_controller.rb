class ApplicationController < ActionController::Base
  
  #When I wrote this, only God and I understood what I was doing
  #Now, God only knows
  
  http_basic_authenticate_with :name => "user", :password => "password"  if ENV["RAILS_ENV"] == "production"
  
  private

  # def current_user
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   end
  #   helper_method :current_user
end
