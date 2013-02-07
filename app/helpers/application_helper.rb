module ApplicationHelper
	def backgroung_image_for_home
		render partial: 'shared/home_bg_image' if controller_name == 'users' && action_name == 'welcome'
	end
end