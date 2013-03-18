module ApplicationHelper
	include NavbarHelper
	include LayoutHelper

	private 
	def app_name
		Rails.application.class.parent_name.titleize
	end
end