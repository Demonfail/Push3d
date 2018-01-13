/// @func xSurfaceCreateFromSprite(sprite, index)
/// @desc Creates a surface from the sprite.
/// @param {real} sprite The id of the sprite.
/// @param {real} index  The sprite subimage index.
/// @return {real} The created surface.
var _surface = surface_create(sprite_get_width(argument0), sprite_get_height(argument0));
surface_set_target(_surface);
draw_clear_alpha(0, 0);
draw_sprite(argument0, argument1, 0, 0);
surface_reset_target();
return _surface;