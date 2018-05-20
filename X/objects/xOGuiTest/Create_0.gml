gui = xGuiCreate();

var _container = xGuiContainer();
_container[? "background"] = $F0F0F0;
xGuiSetRectangle(_container, 32, 32, 512, 256);
xGuiAddWidget(gui, _container);

var _button = xGuiButton("Save");
_button[? "name"] = "btnSave";
xGuiSetPosition(_button, 32, 32);
xGuiAddWidget(_container, _button);

var _checkbox = xGuiCheckbox(true);
_checkbox[? "name"] = "checkbox1";
xGuiSetPosition(_checkbox, 32, 64);
xGuiAddWidget(_container, _checkbox);

var _hslider = xGuiHSlider(0, 10);
_hslider[? "name"] = "slider1";
_hslider[? "width"] = 128;
xGuiSetPosition(_hslider, 32, 96);
xGuiAddWidget(_container, _hslider);

var _hscrollbar = xGuiHScrollbar();
_hscrollbar[? "width"] = 512;
xGuiSetPosition(_hscrollbar, 32, 32 + 256);
xGuiAddWidget(gui, _hscrollbar);

var _vscrollbar = xGuiVScrollbar();
_vscrollbar[? "height"] = 256;
xGuiSetPosition(_vscrollbar, 32 + 512, 32);
xGuiAddWidget(gui, _vscrollbar);