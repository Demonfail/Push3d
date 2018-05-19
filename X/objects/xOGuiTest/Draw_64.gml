xGuiSetRectangle(gui, 0, 0, window_get_width(), window_get_height());
xGuiDraw(gui);
//var _hovered = gui[? "widgetHovered"];
//if (_hovered != noone)
//{
//	draw_text(0, 32, string_replace_all(json_encode(_hovered), ",", ",#"));
//}
draw_text(0, 0, fps_real);