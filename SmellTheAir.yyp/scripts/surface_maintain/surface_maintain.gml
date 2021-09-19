/// @desc Maintains surface
/// @arg id,w,h
function surface_maintain(argument0, argument1, argument2) {

	if !surface_exists(argument0)
	{
		return surface_create(argument1, argument2);
	}

	return argument0;


}
