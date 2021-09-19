/// @desc 

BAIL_CODE

if iFrames > 0 {iFrames = approach(iFrames, 0, 1);}

event_user(14);

if getFlag(Entity_Flag.hostile)
{
	damageOnTouch();
}

x += x_speed;
y += y_speed;