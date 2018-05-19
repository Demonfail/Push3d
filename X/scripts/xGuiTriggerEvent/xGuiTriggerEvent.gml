/// @func xGuiTriggerEvent(widget, event)
// TODO: Rewrite event triggering to iterative if it shows to be heavy
// on performance when recursive.
var _delegate = argument0[? "delegate"];
var _type = argument1[? "type"];

if (argument1[? "target"] == noone)
{
	argument1[? "target"] = argument0;
}

if (ds_map_exists(argument0, "eventActions"))
{
	var _eventActions = argument0[? "eventActions"];
	if (ds_map_exists(_eventActions, _type))
	{
		var _eventList = _eventActions[? _type];
		var _size = ds_list_size(_eventList);
		for (var i = 0; i < _size; ++i)
		{
			script_execute(_eventList[| i], argument0, argument1);
		}
	}
}

if (argument1[? "bubble"] && _delegate != noone)
{
	xGuiTriggerEvent(_delegate, argument1);
}
else if (ds_map_exists(argument0, "events"))
{
	ds_stack_push(argument0[? "events"], argument1);
}
else
{
	ds_map_destroy(argument1);
}

return argument0;