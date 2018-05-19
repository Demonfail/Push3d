/// @func xGuiAddEventAction(widget, event, action)
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