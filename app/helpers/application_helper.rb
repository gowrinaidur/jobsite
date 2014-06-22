module ApplicationHelper

	# Helper methods for datepicker
  def calendar_for(field_id)
		javascript_tag("$( '##{field_id}').datepicker({
	    showOn: 'both',
	    buttonImage: '/assets/icon-calend.png',
	    buttonImageOnly: true,
	    dateFormat: 'yy-mm-dd',
	    changeMonth: true,
      changeYear: true      
	 	});")
  end
end
