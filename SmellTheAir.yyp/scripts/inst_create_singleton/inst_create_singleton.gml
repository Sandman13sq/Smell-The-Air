/// @desc Creates instance if does not exist
/// @arg object
function inst_create_singleton(argument0) {

	if !instance_exists(argument0)
	{
		return inst_create(argument0);
	}

	return argument0;


}
