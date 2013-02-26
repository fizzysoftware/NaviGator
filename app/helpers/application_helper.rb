module ApplicationHelper
	def backgroung_image_for_home
		render partial: 'shared/home_bg_image' if controller_name == 'home' && action_name == 'welcome'
	end

	def evaluate_root_path
		signed_in? ? user_bars_path( current_user ) : root_path
	end

  # this is needed specially with devise :timeoutable feature
  # because devise uses the flash[:timedout] for redirection upon session time out and sets its value to true
  # If the flash is not removed, the resulting markup looks like this after a session time out
  # <div class="flash flash_timedout">true</div>
  def flash_with_valid_messages
    flash.select{|k,v| v.kind_of?( String ) }
  end
end
