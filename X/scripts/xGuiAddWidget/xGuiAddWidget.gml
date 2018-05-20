/// @func xGuiAddWidget(widgetSet, widget)
/// @desc Adds the widget to the widget set.
/// @param {real} widgetSet The widget set to add the widget to.
/// @param {real} widget    The widget to be added.
/// @return {real} The widget set.
xAssert(ds_map_exists(argument0, "items"),
	"Widgets can be added only to a WidgetSet.");
xAssert(argument1[? "delegate"] == noone, "Widget already has a delegate.");
ds_list_add(argument0[? "items"], argument1);
argument1[? "delegate"] = argument0;
return argument0;