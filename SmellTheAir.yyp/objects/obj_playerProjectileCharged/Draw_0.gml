/// @desc 

shader_set(shd_light);

var _x = floor(x), _y = floor(y);

// Hadouken
draw_sprite_ext(
	sprite_index, image_index , _x, _y,
	image_xscale, image_yscale, ANGLE, c_white, ALPHA
	);

// Rotating Balls
draw_sprite_ext(
	sprite_index, image_index + 4, _x, _y,
	image_xscale, image_yscale, ANGLE, COLOR, ALPHA
	);

shader_set(shd_default);