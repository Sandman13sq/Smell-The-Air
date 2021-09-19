/// @desc Returns tile cell
/// @arg x,y
function tileAt(argument0, argument1) {

	var _x = argument0, _y = argument1;

	if _x >= 0 && _x < STAGE_W * UNIT_PX
	&& _y >= 0 && _y < STAGE_H * UNIT_PX
	{
		return STAGE_GRID[# _x div UNIT_PX, _y div UNIT_PX];
	}

	return 0;


}
