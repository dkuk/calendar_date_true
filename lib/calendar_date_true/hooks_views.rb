module CalendarDateTrue
	module CalendarDateTrue
		class Hooks < Redmine::Hook::ViewListener
			render_on :view_layouts_base_html_head, :partial => 'hooks/calendar_date_true/add_css', :layout => false		 
		end
	end
end