/// @desc Spawn Player

with instance_create_depth(x, y - 1, depth, obj_player)
{
	if other.facingRight
	{
		setFlag(Player_Flag.facingRight);
	}
	
	image_xscale = pol(getFlag(Player_Flag.facingRight));
	setAnimation(Animation_Index.light_idle);
}
