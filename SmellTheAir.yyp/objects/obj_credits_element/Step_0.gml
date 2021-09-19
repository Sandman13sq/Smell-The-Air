/// @desc 

BAIL_CODE

theta = (theta + 2) mod 360;
ANGLE = dsin(theta) * 5;

var _amt = intrpl_circ2(0, 1, timer / timerMax);
x = lerp(xStart, xEnd, _amt);
y = lerp(yStart, yEnd, _amt);

switch(state)
{
	case(0): if timer < timerMax {timer++;} break;
	case(1): if timer > 0 {timer--;} break;
}

if doesAnimation {updateAnimation();}

if point_in_circle(mouse_x, mouse_y, x, y, 16)
{
	if mouse_check_button(mb_left)
	{
		xEnd = mouse_x;
		yEnd = mouse_y;
	}
	
	if mouse_check_button_released(mb_left)
	{
		var _str = "";
		if doesAnimation
		{
			_str = str_f("creditsSetAnimation(%d, %s, %d, %d, %d, %d, %d);",
				index, 
				"Animation_Index.__update_this___",
				xStart, yEnd, xEnd, yEnd,
				timerMax
				);
		}
		else
		{
			_str = str_f("creditsSet(%d, %s, %d, %d, %d, %d, %d);",
				index, 
				label == ""? sprite_get_name(sprite_index): "\"" + label + "\"",
				xStart, yEnd, xEnd, yEnd,
				timerMax
				);
		}
		
		clipboard_set_text(_str);
	}
}