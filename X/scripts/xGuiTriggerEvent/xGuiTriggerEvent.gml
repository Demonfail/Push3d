/// @func xGuiTriggerEvent(widget, event, ...)
/// @desc Triggers given events in the widget. Events which have property
///       "bubble" set to `true` are then triggered in the widget's delegate
///       until they reach the GUI system object.
/// @param {real} widget The widget.
/// @param {real} event  The event to be triggered.
/// @note Events that do not bubble are destroyed automatically, but the rest
///       you must destroy by hand!
/// @see xGuiHasEvent
/// @see xGuiGetEvent
/// @see xGuiDestroyEvent
var _widget = argument[0];
var _events = ds_list_create();
var _eventCount = argument_count - 1;
var _firstIteration = true;

for (var i = 1; i < argument_count; ++i)
{
	ds_list_add(_events, argument[i]);
}

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

ds_list_destroy(_events);
return argument[0];