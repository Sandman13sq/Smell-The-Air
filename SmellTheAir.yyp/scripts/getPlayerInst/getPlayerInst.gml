/// @desc Returns player instance
function getPlayerInst() {

	if !instance_exists(obj_player) {return noone;}

	var _inst = instance_nearest(x, y, obj_player);

	with _inst
	{
		if healthPoints <= 0
		|| state == 0 
		|| state == ST_player.stuck
		|| state == ST_player.eventWalk
		{
			return noone;
		}
	}

	return _inst;


}
