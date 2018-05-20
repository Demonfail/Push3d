/// @func xGuiTriggerEventList(widget, events)
/// @desc Triggers given events in the widget. Events which have property
///       "bubble" set to `true` are then triggered in the widget's delegate
///       until they reach the GUI system object.
/// @param {real} widget The widget.
/// @param {real} events The list of events to be triggered.
/// @note Events that do not bubble are destroyed automatically, but the rest
///       you must destroy by hand! Also the passed list of events is not
///       deleted by this script and therefore it's up to you as well.
/// @see xGuiTriggerEvent
/// @see xGuiHasEvent
/// @see xGuiGetEvent
/// @see xGuiDestroyEvent
var _widget = argument0;
var _events = argument1;
var _eventCount = ds_list_size(_events);
var _firstIteration = true;

while (_widget != noone)
{
	for (var i = 0; i < _eventCount; ++i)
	{
		var _event = _events[| i];
		var _type = _event[? "type"];
		// Set event's target to the current widget (if not yet specified).
		if (_firstIteration && _event[? "target"] == noone)
		{
			_event[? "target"] = _widget;
		}
		// Execute event actions.
		if (ds_map_exists(_widget, "eventActions"))
		{
			var _eventActions = _widget[? "eventActions"];
			if (ds_map_exists(_eventActions, _type))
			{
				var _actions = _eventActions[? _type];
				var _size = ds_list_size(_actions);
				for (var i = 0; i < _size; ++i)
				{
					script_execute(_actions[| i], _widget, _event);
				}
			}
		}
		if (ds_map_exists(_widget, "events"))
		{
			// Add to event stack in the top level GUI object.
			ds_stack_push(_widget[? "events"], _event);
		}
		else if (!_event[? "bubble"])
		{
			// If the event does not bubble, delete it from the event list.
			ds_list_delete(_events, i);
			xGuiDestroyEvent(_event);
			--i;
			--_eventCount;
		}
	}
	// Trigger in the delegate.
	_widget = _widget[? "delegate"];
	_firstIteration = false;
}

return argument0;