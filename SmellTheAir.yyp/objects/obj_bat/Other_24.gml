/// @desc State Update

switch(state)
{
	// Flying
	case(ST_bat.fly):	// Update Only
		if getPlayerInst()
		{
			var _x = getPlayerX(), _xDiff = (x - _x),
				_y = getPlayerY(), _yDiff = (y - _y), 
				_range = 10, _xspd = 1;
		
			if _yDiff < -_range
			{
				y_speed = approach(y_speed, flySpeed, flyAcc);
			}
			else if _yDiff > (_range * 2)
			{
				y_speed = approach(y_speed, -flySpeed, flyAcc);
			}
			
			if abs(_xDiff) > 64 || abs(x_speed) < 1
			{
				if abs(_yDiff) > _range + 16
				{
					_xspd = 0.3;
				}
				
				image_xscale = -pol(_xDiff);
			}
			
			x_speed = approach(x_speed, _xspd * signToPlayerX(), 0.05);
		}
		
		flapStep = (flapStep + 1) mod 4;
		image_index = flapStep div 2;
		break;
	
	// Stun
	case(ST_bat.stun):	// Update Only
		if stun {stun--;} else {setState(ST_bat.fly);}
		break;
	
	// Bump
	case(ST_bat.bump):	// Update Only
		if bump {bump--;} else {setState(ST_bat.fly);}
		break;
}