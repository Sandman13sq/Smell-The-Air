/// @desc Creates afterimage
/// @arg interval,visCount,flashColor,flashStrength
function create_afterimage(argument0, argument1, argument2, argument3) {

	var _inst = instance_create_depth(x, y, depth + 2, obj_afterimage);

	with _inst
	{
		stepInterval = argument0;
		life = argument1; // Amount of times to appear
	
		flashColor = argument2;
		flashStrength = argument3;
	
		sprite_index = other.sprite_index;
		image_index = other.image_index;
		image_xscale = other.image_xscale;
	}

	return _inst;


}
