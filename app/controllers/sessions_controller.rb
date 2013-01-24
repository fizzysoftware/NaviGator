class SessionsController < Devise::OmniauthCallbacksController
  # I dedicate all this code, all my work, to my girl friend, Swati, who will
  # have to support me once it gets
  # released into the public.



  def all
   user = User.from_omniauth(env["omniauth.auth"])
   if user.persisted?
     sign_in_and_redirect(user)
   else
     session["devise.user_attributes"] = user.attributes
     redirect_to new_user_registration_url
  end

  end



  alias_method :facebook, :all
end