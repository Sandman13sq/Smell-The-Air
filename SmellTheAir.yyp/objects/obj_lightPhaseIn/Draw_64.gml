/// @desc 

BAIL_CODE

if state == 0
{
	var _x = CAMERA_W / 2, _y = CAMERA_H / 2, _str = "READY";
	
	draw_set_halign(1);
	draw_set_valign(1);

	draw_set_color(c_snes);
	draw_text(_x + 1, _y + 1, _str);

	draw_set_color(COLOR);
	draw_text(_x, _y, _str);

	draw_set_color(c_white);
	
	draw_set_halign(0);
	draw_set_valign(0);
}
