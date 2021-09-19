/// @desc 

shader_set(shd_light);

var _x = floor(x), _y = floor(y);

draw_sprite(sprite_index, 4, _x, _y);

draw_sprite_ext(
	sprite_index, image_index, _x, _y,
	image_xscale, image_yscale, ANGLE, COLOR, ALPHA
	);

shader_set(shd_default);