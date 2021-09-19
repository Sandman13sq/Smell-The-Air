/// @desc 

draw_set_align(0, 0);

draw_sprite_stretched_ext(sprite_index, image_index, 0, 0,
	CAMERA_W, CAMERA_H, c_white, 1);

var _x = 248, _y = 48;
draw_shape_text(_x + 1, _y + 1, "Thank you for your time", c_snes, 1);
draw_shape_text(_x, _y, "Thank you for your time", wasDamaged? 0x996688: LIGHTCOLOR, 1);

draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 0, ALPHA);
