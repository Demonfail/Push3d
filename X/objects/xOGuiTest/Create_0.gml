gui = xGuiCreate();

var _container = xGuiContainer();
_container[? "background"] = $F0F0F0;
xGuiSetRectangle(_container, 32, 32, 128, 128);
xGuiAddWidget(gui, _container);

var _button = xGuiButton("Save");
_button[? "name"] = "buttonSave";
xGuiSetPosition(_button, 32, 32);
xGuiAddWidget(_container, _button);
  
var _vscrollbar = xGuiVScrollbar();
_vscrollbar[? "height"] = 128;
xGuiSetPosition(_vscrollbar, 32 + 128, 32);
xGuiAddWidget(gui, _vscrollbar);