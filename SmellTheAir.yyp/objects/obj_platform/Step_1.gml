/// @desc 

BAIL_CODE

if y != ystart
{
	y_speed += pol(y < ystart) * y_acc;
	if !isApproaching(y, ystart, y_speed) {y_speed *= 0.95;}
	
	if abs(y_speed) < 0.25
	&& diff(y, ystart) < 0.25
	{
		y_speed = 0;
		y = ystart;
	}
}

y += y_speed;

propellerStep = loop(propellerStep + 0.5, 1, 4);
image_index = propellerStep;