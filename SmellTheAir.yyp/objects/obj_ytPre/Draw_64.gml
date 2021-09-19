/// @desc 

draw_sprite_stretched_ext(
	spr_previewImage, 0, 0, 0, CAMERA_W, CAMERA_H,
	merge_color(c_white, c_dkgray, ALPHA), 1
	);

draw_set_align(1, 0);

var _x = CAMERA_W / 2, _y = 100;

for (var i = 0; i < state; i++)
{
	draw_shape_text(_x + 1, _y + 1, displayString[i], c_snes, 1);
	
	draw_shape_text(
		_x, _y, displayString[i], 
		(i == state - 1 && boolStep(flashStep, 8))? c_blue: c_white, 1
		);
	
	_y += 20;
}

draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 0, fadeAlpha);

/*
draw_set_align(0, 0);
draw_string_list(0, 0,
	step, state, ALPHA
	)
