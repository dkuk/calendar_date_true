module CalendarDateTrue
    class HookControllerIssuesEditBeforeSave < Redmine::Hook::ViewListener
		def controller_issues_edit_before_save(context={})
			if context[:params] && context[:params][:issue]	
				context[:issue].custom_field_values = context[:issue].custom_field_values.inject({}) {|h,v|
					if(v.custom_field.field_format == 'date' and v.value.to_s!='')
						h[v.custom_field_id] = Date.strptime(v.value, Setting.date_format).strftime('%Y-%m-%d'); 
					else
						h[v.custom_field_id] = v.value; 
					end
					h}
			end
        return ''
      end

      alias_method :controller_issues_new_before_save, :controller_issues_edit_before_save
    end
end