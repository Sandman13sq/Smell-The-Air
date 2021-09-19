/// @desc 

var _flash = charge > 120 && boolStep(charge, 3);

if _flash {draw_set_flash(bgr(c_shade), 1);}

// Inherit the parent event
event_inherited();

if _flash {draw_set_flash(0, 0);}

if state == ST_carpet.charge
{
	var _draw = 0;
	
	if charge < 60
	{
		if charge mod 5 == 0 {_draw = 1;}
	}
	else if charge < 100
	{
		if charge mod 3 == 0 {_draw = 1;}
	}
	else {_draw = 1;}
	
	if _draw
	{
		draw_sprite(spr_shadowBall, charge mod 2, x + image_xscale * 10, y);
	}
}