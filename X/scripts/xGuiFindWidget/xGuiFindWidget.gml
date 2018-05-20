/// @func xGuiFindWidget(widgetSet, name)
/// @desc Recursively finds a widget of given name within the widget set.
/// @param {real}   widgetSet The widget set to search within.
/// @param {string} name      The name of the widget to be found.
/// @return {real} The found widget or the constant `noone` if no widget was
///                found.
// TODO: Rewrite widget search to iterative.
if (argument0[? "name"] == argument1)
{
	return argument0;
}

if (ds_map_exists(argument0, "items"))
{
	var _items = argument0[? "items"];
	for (var i = ds_list_size(_items) - 1; i >= 0; --i)
	{
		var _widget = xGuiFindWidget(_items[| i], argument1);
		if (_widget != noone)
		{
			return _widget;
		}
	}
}

return noone;