/// @desc 

BAIL_CODE

if bumpOnTouch(0, 3) // Defeat on Bump
{
	doDamage(self, healthPointsMax);
}
else {damageOnTouch();}

if moveDelay > 0
{
	moveDelay--;
	x_speed *= 0.9;
	y_speed *= 0.9;
}
else
{
	var _x = getPlayerX(), _y = getPlayerY(),
		_xrange = 64, _yrange = 64;
	
	if !in_range(x, _x - _xrange, _x + _xrange)
	{x_speed = approach(x_speed, signToPlayerX() * moveSpeed, moveAcc);}
	
	if !in_range(y, _y - _yrange, _y + _yrange)
	{y_speed = approach(y_speed, signToPlayerY() * moveSpeed, moveAcc);}
	
	image_xscale = signToPlayerX();
}

x += x_speed;
y += y_speed;

updateAnimation();