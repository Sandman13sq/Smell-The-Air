/// @desc 

switch(state)
{
	// Drop
	case(ST_lightSwitch.drop):
		if y < ystart
		{
			y_speed += 0.25;
			y += y_speed;
		}
		else {setState(ST_lightSwitch.shake)};
		break;
	
	// Shake
	case(-ST_lightSwitch.shake):
		shakeY = 10; y = ystart;
		break;
		
	case(ST_lightSwitch.shake):
		if shakeY
		{
			shakeY--;
			y = ystart + getShakeX(shakeY);
		}
		break;
	
	// Rise
	case(-ST_lightSwitch.rise):
		y_speed = 3;
		break;
	
	case(ST_lightSwitch.rise):
		if y > -64
		{
			y += y_speed;
			y_speed -= 0.2;
		}
		else {instance_destroy(); return;}
		break;
}