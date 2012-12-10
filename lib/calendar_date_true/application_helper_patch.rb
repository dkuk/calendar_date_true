module CalendarDateTrue
  module ApplicationHelperPatch
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)	

			base.class_eval do
			alias_method_chain :calendar_for, :calendar_date_true
			end
			
		end
		
		module ClassMethods   
		
		end
		
		module InstanceMethods
			def calendar_for_with_calendar_date_true(field_id)
				if Setting.date_format.blank?
					calendar_for_without_calendar_date_true(field_id)
				else
					include_calendar_headers_tags
					image_tag("calendar.png", {:id => "#{field_id}_trigger", :alt => Setting.date_format, :class => "calendar-trigger"}) +
					javascript_tag("Calendar.setup({inputField : '#{field_id}', ifFormat : '#{Setting.date_format}', button : '#{field_id}' }); date_format('#{field_id}', '#{Setting.date_format}');")			
				end
			end
		end
	end
end