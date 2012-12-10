function date_format(date_field_id, format)
	{
	
	if(/^\d{4}-\d{2}-\d{2}$/.test($(date_field_id).value))
		{
		var date = $(date_field_id).value.split('-');
		var d = date[2];
		var m = date[1];
		var Y = date[0];
		var new_date = format.split('%m').join(m).split('%d').join(d).split('%Y').join(Y);
		$(date_field_id).value=new_date;
		}
	}