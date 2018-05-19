/// @func xGuiFindWidget(widgetSet, name)
// TODO: Rewrite widget search to iterative if it shows to be heavy
// on performance when recursive.
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