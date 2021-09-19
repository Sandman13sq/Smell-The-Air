/// @desc SUCC

BAIL_CODE

if state == ST_sneez.succ
{
	with collision_rectangle(
		x + 20 * image_xscale, bbox_bottom, 
		x + range * image_xscale, 
		bbox_top - 64, PLAYER, 0, 1)
	{
		var _spd, _sign = pol(other.x - x);
		
		if getFlag(Player_Flag.inAir) {_spd = 3;}
		else
		{
			if pol(getFlag(Player_Flag.facingRight)) == _sign
			&& x_speed != 0
			{
				_spd = 0.7;
			}
			else {_spd = 1.7;}
		}
		
		_spd *= other.strengthAmt;
		
		x += _sign * _spd;
		
		//x_speed = approach(x_speed, pol(other.x - x) * 4, _spd);
	}
	
	if strengthAmt < 1 {strengthAmt = approach(strengthAmt, 1, 0.01);};
}

if playerInst
{
	var _x = x - 3 * image_xscale + getShakeX(stun);
			
	with playerInst
	{
		x = _x; 
		y = other.y - 19;
	}
}