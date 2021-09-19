/// @desc 

var _inst = instance_place(x, y, PLAYER);

if _inst
{
	with _inst
	{
		if healthPoints - 1 > 0
		{
			x = lastSolidPos[0];
			y = lastSolidPos[1];
			cameraSnapToPlayer();
		}
		else if state != ST_player.defeat_fall
		{
			setState(ST_player.defeat_fall);
		}
		
		doDamage(_inst, 1);
	}
}
