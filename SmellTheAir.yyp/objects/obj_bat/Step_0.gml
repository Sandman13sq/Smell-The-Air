/// @desc 

BAIL_CODE

if bump == 0
{
	if bumpOnTouch(2, 2)
	{
		bump = 10;
		image_index = 2;
		setState(ST_bat.bump);
	}
	else {damageOnTouch();}
}

event_user(14);

x += x_speed;
y += y_speed;