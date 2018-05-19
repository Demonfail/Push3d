gui = xGuiCreate();

var _container = xGuiContainer();
_container[? "background"] = $F0F0F0;
xGuiSetRectangle(_container, 32, 32, 256, 128);
xGuiAddWidget(gui, _container);

var _button = xGuiButton("Save");
_button[? "name"] = "buttonSave";
xGuiSetPosition(_button, 32, 32);
xGuiAddWidget(_container, _button);

var _hscrollbar = xGuiHScrollbar();
_hscrollbar[? "width"] = 256;
xGuiSetPosition(_hscrollbar, 32, 32 + 128);
xGuiAddWidget(gui, _hscrollbar);

var _vscrollbar = xGuiVScrollbar();
_vscrollbar[? "height"] = 128;
xGuiSetPosition(_vscrollbar, 32 + 256, 32);
xGuiAddWidget(gui, _vscrollbar);