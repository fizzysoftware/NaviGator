class HomeController < ApplicationController
	# before_filter :populate_user

  def welcome
  end

  def about_us
  	@user = current_user if signed_in?
  end

  def policy
  	@user = current_user if signed_in?
  end

end
