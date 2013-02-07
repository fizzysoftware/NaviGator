class SessionsController < Devise::OmniauthCallbacksController
  # I dedicate all this code, all my work, to my girl friend, Swati, who will
  # have to support me once it gets
  # released into the public.


  def all
    user = User.from_omniauth(env["omniauth.auth"])
    if ( user.persisted? )
      sign_in_and_redirect(user)
    else
      generated_password = Devise.friendly_token.first(6)
      if( user.update_attributes( password: generated_password ) )
        user.confirm!
        user.welcome_mail( generated_password)
        sign_in_and_redirect(user)
      else
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_url
      end
    end
  end


  alias_method :facebook, :all
end