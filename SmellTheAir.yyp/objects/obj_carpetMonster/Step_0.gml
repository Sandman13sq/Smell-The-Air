/// @desc 

BAIL_CODE

if bump == 0
{
	if bumpOnTouch(-1, 2)
	{
		bump = 10;
		image_xscale *= -1;
		if state < ST_carpet.whipUp {setState(ST_carpet.whipUp);}
	}
	else {damageOnTouch();}
}

event_user(14);

if !stun {x += x_speed;}