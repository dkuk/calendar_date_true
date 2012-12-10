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
        html = calendar_for_without_calendar_date_true(field_id)+
               javascript_tag("$(function() { $( '##{field_id}' ).datepicker( 'option', 'dateFormat', 'dd.mm.yy' ); 
                                              $( '##{field_id}' ).datepicker( 'option', 'showOn', 'focus' );
                                              $( '##{field_id}' ).datepicker( 'option', 'showOtherMonths', true );
                                              $( '##{field_id}' ).datepicker( 'option', 'selectOtherMonths', true );
                                });")
        html.html_safe       
      end
    end

  end
end