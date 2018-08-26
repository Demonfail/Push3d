/// @func p3d_gui_draw(gui)
/// @desc Draws the GUI system.
/// @param {real} gui The GUI system to be drawed.
/// @note This also handles the GUI logic!
var _gui = argument0;

////////////////////////////////////////////////////////////////////////////////
// Get mouse and keyboard state
var _mouseX     = window_mouse_get_x();
var _mouseY     = window_mouse_get_y();
var _mouseXPrev = _gui[? "mouseX"];
var _mouseYPrev = _gui[? "mouseY"];

var _mousePress = noone;
if (mouse_check_button_pressed(mb_any))
{
	_mousePress = mouse_button;
}

var _mouseDown = noone;
if (mouse_check_button(mb_any))
{
	_mouseDown = mouse_button;
}

var _mouseUp = noone;
if (mouse_check_button_released(mb_any))
{
	_mouseUp = mouse_lastbutton;
}

var _mouseWheel = mouse_wheel_up() - mouse_wheel_down();

var _altDown   = keyboard_check(vk_alt);
var _ctrlDown  = keyboard_check(vk_control);
var _shiftDown = keyboard_check(vk_shift);

var _keyPress = noone;
if (keyboard_check_pressed(vk_anykey))
{
	_keyPress = keyboard_key;
}

var _keyDown = noone;
if (keyboard_check(vk_anykey))
{
	_keyDown = keyboard_key;
}

var _keyUp = noone;
if (keyboard_check_released(vk_anykey))
{
	_keyUp = keyboard_lastkey;
}

////////////////////////////////////////////////////////////////////////////////
// Update GUI
var _itemsStack     = ds_stack_create();
var _indexStack     = ds_stack_create();
var _pushStack      = ds_stack_create(); // y, x, ...
var _matrixStack    = ds_stack_create();
var _containerStack = ds_stack_create();

var _listWithRoot = ds_list_create();
ds_list_add(_listWithRoot, _gui);

ds_stack_push(_itemsStack, _listWithRoot);
ds_stack_push(_indexStack, 0);
ds_stack_push(_pushStack, 0, 0);
ds_stack_push(_matrixStack, matrix_get(matrix_world));

var _hovered      = _gui[? "widgetHovered"];
var _newHovered   = noone;
var _topContainer = noone;

while (!ds_stack_empty(_itemsStack))
{
	var _items = ds_stack_pop(_itemsStack);
	var _size  = ds_list_size(_items);
	var _pushY = ds_stack_pop(_pushStack);
	var _pushX = ds_stack_pop(_pushStack);

	// Reset transformation
	if (!ds_stack_empty(_matrixStack))
	{
		matrix_set(matrix_world, ds_stack_pop(_matrixStack));
	}

	// Draw container
	if (!ds_stack_empty(_containerStack))
	{
		var _container = ds_stack_pop(_containerStack);
		var _redrawing = _container[? "redrawing"];
		if (_redrawing)
		{
			surface_reset_target();
		}

		if (_topContainer == _container || _redrawing)
		{
			if (ds_map_exists(_container, "scrDraw"))
			{
				script_execute(_container[? "scrDraw"], _container);
			}
		}

		if (_container == _topContainer)
		{
			_topContainer = noone;
		}
		_container[? "redrawing"] = false;
	}

	// Go through items
	for (var i = ds_stack_pop(_indexStack); i < _size; ++i)
	{
		var _item     = _items[| i];
		var _x        = _item[? "x"];
		var _y        = _item[? "y"];
		var _width    = _item[? "width"];
		var _height   = _item[? "height"];
		var _realX    = _pushX + _x;
		var _realY    = _pushY + _y;
		var _hasItems = ds_map_exists(_item, "items");
		var _scrollX  = 0;
		var _scrollY  = 0;

		if (ds_map_exists(_item, "scrollX"))
		{
			_scrollX = -_item[? "scrollX"];
		}

		if (ds_map_exists(_item, "scrollY"))
		{
			_scrollY = -_item[? "scrollY"];
		}

		_item[? "realX"] = _realX;
		_item[? "realY"] = _realY;

		// Set hovered
		if (_mouseX >= _realX
			&& _mouseY >= _realY
			&& _mouseX <= _realX + _width
			&& _mouseY <= _realY + _height)
		{
			_newHovered = _item;
		}

		// Feed mouse and keyboard input
		var _eventList = ds_list_create();

		if (_mousePress != noone)
		{
			ds_list_add(_eventList,
				p3d_gui_event_mousepress(_mousePress, _altDown, _ctrlDown, _shiftDown));
		}
		else if (_mouseDown != noone)
		{
			ds_list_add(_eventList,
				p3d_gui_event_mousedown(_mouseDown, _altDown, _ctrlDown, _shiftDown));
		}

		if (_mouseUp != noone)
		{
			ds_list_add(_eventList,
				p3d_gui_event_mouseup(_mouseUp, _altDown, _ctrlDown, _shiftDown));
		}

		if (_keyPress != noone)
		{
			ds_list_add(_eventList,
				p3d_gui_event_keypress(_keyPress, _altDown, _ctrlDown, _shiftDown));
		}
		else if (_keyDown != noone)
		{
			ds_list_add(_eventList,
				p3d_gui_event_keydown(_keyDown, _altDown, _ctrlDown, _shiftDown));
		}

		if (_keyUp != noone)
		{
			ds_list_add(_eventList,
				p3d_gui_event_keyup(_keyUp, _altDown, _ctrlDown, _shiftDown));
		}

		p3d_gui_trigger_event_list(_item, _eventList);
		ds_list_destroy(_eventList);

		// Draw
		if (ds_map_exists(_item, "surface"))
		{
			var _surOld  = _item[? "surface"];
			var _surface = p3d_surface_check(_surOld, _width, _height);
			var _redraw  = (_surOld != _surface) || _item[? "redraw"];
			_item[? "surface"] = _surface;

			if (_topContainer == noone)
			{
				_topContainer = _item;
			}
			ds_stack_push(_containerStack, _item);

			if (_redraw)
			{
				p3d_gui_trigger_event(_item, p3d_gui_event_redraw());
				_item[? "redraw"]    = false;
				_item[? "redrawing"] = true;
				surface_set_target(_surface);
				draw_clear(_item[? "background"]);
				// Apply scroll
				var _matrix = matrix_get(matrix_world);
				ds_stack_push(_matrixStack, _matrix);
				matrix_set(matrix_world,
					matrix_build(_scrollX, _scrollY, 0, 0, 0, 0, 1, 1, 1));
			}
		}
		else
		{
			if (_topContainer == noone || _topContainer[? "redrawing"])
			{
				if (ds_map_exists(_item, "scrDraw"))
				{
					script_execute(_item[? "scrDraw"], _item);
				}

				// Apply transformation
				if (_hasItems)
				{
					var _matrix = matrix_get(matrix_world);
					ds_stack_push(_matrixStack, _matrix);
					matrix_set(matrix_world,
						matrix_multiply(_matrix,
							matrix_build(_x, _y, 0, 0, 0, 0, 1, 1, 1)));
				}
			}
		}

		// Process items (if any)
		if (_hasItems)
		{
			ds_stack_push(_itemsStack, _items);
			ds_stack_push(_indexStack, i + 1);
			ds_stack_push(_pushStack, _pushX, _pushY);
			_pushX = _realX + _scrollX;
			_pushY = _realY + _scrollY;
			_items = _item[? "items"];
			_size  = ds_list_size(_items);
			i      = -1;
		}
	}
}

ds_list_destroy(_listWithRoot);
ds_stack_destroy(_itemsStack);
ds_stack_destroy(_indexStack);
ds_stack_destroy(_pushStack);
ds_stack_destroy(_containerStack);
ds_stack_destroy(_matrixStack);

////////////////////////////////////////////////////////////////////////////////
// Mouse events
var _mouseMoved = (_mouseXPrev != _mouseX || _mouseYPrev != _mouseY);

if (_mouseMoved || is_undefined(_hovered))
{
	// Mouse enter/leave events
	var _lastUndefined = is_undefined(_hovered);
	if (_lastUndefined || _hovered != _newHovered)
	{
		if (!_lastUndefined && _hovered != noone)
		{
			p3d_gui_trigger_event(_hovered, p3d_gui_event_mouseleave());
		}

		if (_newHovered != noone)
		{
			p3d_gui_trigger_event(_newHovered, p3d_gui_event_mouseenter());
		}
	}

	// Mouse move event
	if (_newHovered != noone)
	{
		p3d_gui_trigger_event(_newHovered,
			p3d_gui_event_mousemove(_mouseDown,
				_mouseX, _mouseY, _mouseXPrev, _mouseYPrev,
				_altDown, _ctrlDown, _shiftDown));
	}

	_gui[? "widgetHovered"] = _newHovered;
	_hovered = _newHovered;
	_gui[? "mouseXPrev"] = _mouseXPrev;
	_gui[? "mouseYPrev"] = _mouseYPrev;
	_gui[? "mouseX"] = _mouseX;
	_gui[? "mouseY"] = _mouseY;
}

// Trigger in hovered only
if (!is_undefined(_hovered)
	&& _hovered != noone)
{
	if (_mousePress == mb_left)
	{
		p3d_gui_trigger_event(_hovered,
			p3d_gui_event_click(_altDown, _ctrlDown, _shiftDown));
		_gui[? "widgetDrag"] = _hovered;
	}

	if (_mouseWheel != 0)
	{
		p3d_gui_trigger_event(_hovered,
			p3d_gui_event_mousewheel(_mouseWheel, _altDown, _ctrlDown, _shiftDown));
	}
}

// Dragging
var _widgetDrag = _gui[? "widgetDrag"];
if (_widgetDrag != noone)
{
	var _mouseXDrag = _mouseX - _widgetDrag[? "realX"];
	var _mouseYDrag = _mouseY - _widgetDrag[? "realY"];

	if (_mouseMoved)
	{
		if (!_gui[? "dragging"])
		{
			_gui[? "dragging"] = true;
			p3d_gui_trigger_event(_widgetDrag,
				p3d_gui_event_dragstart(_mouseXDrag, _mouseYDrag));
		}
		p3d_gui_trigger_event(_widgetDrag, p3d_gui_event_drag(_mouseXDrag, _mouseYDrag));
	}

	if (_mouseUp == mb_left)
	{
		_gui[? "widgetDrag"] = noone;
		_gui[? "dragging"] = false;
		p3d_gui_trigger_event(_widgetDrag, p3d_gui_event_dragend(_mouseXDrag, _mouseYDrag));
	}
}