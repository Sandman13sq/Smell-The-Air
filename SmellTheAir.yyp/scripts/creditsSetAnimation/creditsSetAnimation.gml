/// @desc Sets position for credits sketch
/// @arg index,animationIndex,x1,y1,x2,y2,time
function creditsSetAnimation(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _inst = instance_create_depth(argument2, argument3, 0, obj_credits_element);

	with _inst
	{
		doesAnimation = true;
		setAnimation(argument1);
	
		xStart = argument2;
		yStart = argument3;
		xEnd = argument4;
		yEnd = argument5;
	
		timer = 0;
		timerMax = argument6;
	
		index = argument0;
	
		if xEnd > CAMERA_W / 2
		{
			image_xscale *= -1;
		}
	}

	with obj_credits
	{
		element[argument0] = _inst;
	}


}
