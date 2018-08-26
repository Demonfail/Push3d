// @desc Process GUI events
while (p3d_gui_has_event(gui))
{
	var _event = p3d_gui_get_event(gui);
	//show_debug_message(json_encode(_event));

	switch (p3d_gui_get_event_target_name(_event))
	{
		case "btnSave":
			if (_event[? "type"] == "click")
			{
				show_debug_message("Save game!");
			}
			break;

		case "checkbox1":
			if (_event[? "type"] == "change")
			{
				show_debug_message(
					"Prev: " + string(_event[? "prev"])
					+ "\nNew: " + string(_event[? "new"]));
			}
			break;

		case "slider1":
			if (_event[? "type"] == "change")
			{
				show_debug_message(
					"Prev: " + string(_event[? "prev"])
					+ "\nNew: " + string(_event[? "new"]));
			}
			break;
	}

	p3d_gui_destroy_event(_event);
}