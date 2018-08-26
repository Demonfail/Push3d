/// @func p3d_assert_not_equal(exp, val, msg)
/// @desc Shows the error message if the expression is equal to `val`.
/// @param {any}    exp The expression to assert.
/// @param {any}    val The expected value.
/// @param {string} msg The error message.
if (typeof(argument0) == typeof(argument1)
	&& argument0 == argument1)
{
	show_error(argument2, true);
}