//==============================================================================
// Process GUI events
while (xGuiHasEvent(gui))
{
	var _event = xGuiGetEvent(gui);
	show_debug_message(json_encode(_event));
	if (_event[? "type"] == "click")
	{
		if (xGuiGetEventTargetName(_event) == "buttonSave")
		{
			show_message("Save game!");
		}
	}
	xGuiDestroyEvent(_event);
}