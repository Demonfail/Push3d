gui = p3d_gui_create();

var _container = p3d_gui_container();
_container[? "background"] = $F0F0F0;
p3d_gui_set_rectangle(_container, 32, 32, 512, 256);
p3d_gui_add_widget(gui, _container);

var _button = p3d_gui_button("Save");
_button[? "name"] = "btnSave";
p3d_gui_set_position(_button, 32, 32);
p3d_gui_add_widget(_container, _button);

var _checkbox = p3d_gui_checkbox(true);
_checkbox[? "name"] = "checkbox1";
p3d_gui_set_position(_checkbox, 32, 64);
p3d_gui_add_widget(_container, _checkbox);

var _hslider = p3d_gui_hslider(0, 10);
_hslider[? "name"] = "slider1";
_hslider[? "width"] = 128;
p3d_gui_set_position(_hslider, 32, 96);
p3d_gui_add_widget(_container, _hslider);

var _hscrollbar = p3d_gui_hscrollbar();
_hscrollbar[? "width"] = 512;
p3d_gui_set_position(_hscrollbar, 32, 32 + 256);
p3d_gui_add_widget(gui, _hscrollbar);

var _vscrollbar = p3d_gui_vscrollbar();
_vscrollbar[? "height"] = 256;
p3d_gui_set_position(_vscrollbar, 32 + 512, 32);
p3d_gui_add_widget(gui, _vscrollbar);