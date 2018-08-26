/// @func p3d_gui_trigger_event(widget, event, ...)
/// @desc Triggers given events in the widget. Events which have property
///       "bubble" set to `true` are then triggered in the widget's delegate
///       until they reach the GUI system object.
/// @param {real} widget The widget.
/// @param {real} event  The event to be triggered.
/// @note Events that do not bubble are destroyed automatically, but the rest
///       you must destroy by hand!
/// @see p3d_gui_trigger_event_ist
/// @see p3d_gui_has_event
/// @see p3d_gui_get_event
/// @see p3d_gui_destroy_event
var _widget         = argument[0];
var _events         = ds_list_create();
var _eventCount     = argument_count - 1;
var _firstIteration = true;
for (var i = 1; i < argument_count; ++i)
{
	ds_list_add(_events, argument[i]);
}
p3d_gui_trigger_event_list(_widget, _events);
ds_list_destroy(_events);
return argument[0];