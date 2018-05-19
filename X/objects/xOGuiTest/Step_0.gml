//==============================================================================
// Process GUI events
while (xGuiHasEvent(gui))
{
	var _event = xGuiGetEvent(gui);
	show_debug_message(json_encode(_event));

	switch (xGuiGetEventTargetName(_event))
	{
		case "btnSave":
			if (_event[? "type"] == "click")
			{
				show_message("Save game!");
			}
			break;

		case "checkbox1":
			if (_event[? "type"] == "change")
			{
				show_message(
					"Prev: " + string(_event[? "prev"])
					+ "\nNew: " + string(_event[? "new"]));
			}
			break;
	}

	xGuiDestroyEvent(_event);
}