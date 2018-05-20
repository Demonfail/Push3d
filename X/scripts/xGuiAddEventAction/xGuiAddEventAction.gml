/// @func xGuiAddEventAction(widget, event, action)
/// @desc Adds an event action to the widget. This action will then
///       be executed every time the widgets receives an event of
///       given type.
/// @param {real}   widget The widget to add the action to.
/// @param {string} event  The name of the event on which the action
///                        should be executed.
/// @param {real}   action A script (the action) that will be executed.
///                        Must take two arguments, where the first one
///                        will be the widget that received the event
///                        and the second one will be the event itself.
/// @return {real} The widget.
xAssert(script_exists(argument2), "Cannot add unexisting event action.");
var _eventActions;
if (ds_map_exists(argument0, "eventActions"))
{
	_eventActions = argument0[? "eventActions"];
}
else
{
	_eventActions = ds_map_create();
	ds_map_add_map(argument0, "eventActions", _eventActions);
}
var _eventList;
if (ds_map_exists(_eventActions, argument1))
{
	_eventList = _eventActions[? argument1];
}
else
{
	_eventList = ds_list_create();
	ds_map_add_list(_eventActions, argument1, _eventList);
}
xDsListAddUnique(_eventList, argument2);
return argument0;