/// @desc Drops health
/// @arg health
function dropHealth(argument0) {

	with instance_create_depth(x, y, Layer_Depth.player - 1, obj_healthDrop)
	{
		healthPoints = argument0;
	}


}
