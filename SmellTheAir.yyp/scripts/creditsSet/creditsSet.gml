/// @desc Sets position for credits sketch
/// @arg index,sprite/caption,x1,y1,x2,y2,time
function creditsSet(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _inst = instance_create_depth(argument2, argument3, 0, obj_credits_element);

	with _inst
	{
		if is_string(argument1) {label = argument1;}
		else 
		{
			sprite_index = argument1;
			var _s = 1 / min(
				(bbox_right - bbox_left) * 0.5,
				(bbox_bottom - bbox_top) * 0.5
				);
			image_xscale = 0.3;
			image_yscale = 0.3;
		}
	
		xStart = argument2;
		yStart = argument3;
		xEnd = argument4;
		yEnd = argument5;
	
		index = argument0;
	
		timer = 0;
		timerMax = argument6;
	}

	with obj_credits
	{
		element[argument0] = _inst;
	}


}
