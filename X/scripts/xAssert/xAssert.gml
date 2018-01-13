/// @func xAssert(exp, msg)
/// @desc Shows the error message if the expression is not
///       a `real` (`bool`) or equals to `0` (`false`) and
///       aborts the game.
/// @param {any}    exp The expression to assert.
/// @param {string} msg The error message.
if (!(is_real(argument0) || is_bool(argument0)) || !argument0) {
	show_error(argument1, true);
}