/// @desc Returns true if value is in range
/// @arg value,bound1,bound2
function in_range(argument0, argument1, argument2) {

	return argument0 >= min(argument1, argument2)
		&& argument0 <= max(argument1, argument2);


}
