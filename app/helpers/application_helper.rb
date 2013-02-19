module ApplicationHelper
	def backgroung_image_for_home
		render partial: 'shared/home_bg_image' if controller_name == 'home' && action_name == 'welcome'
	end

	def evaluate_root_path
		signed_in? ? user_bars_path( current_user ) : root_path
	end
end