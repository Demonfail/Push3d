/// @func xGuiAddWidget(widgetSet, widget)
xAssert(ds_map_exists(argument0, "items"), "Widgets can be added only to a WidgetSet.");
xAssert(argument1[? "delegate"] == noone, "Widget already has a delegate.");
ds_list_add(argument0[? "items"], argument1);
argument1[? "delegate"] = argument0;
return argument0;