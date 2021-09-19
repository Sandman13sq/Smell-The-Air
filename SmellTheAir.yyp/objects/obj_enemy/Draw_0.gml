/// @desc

draw_sprite_ext(
	sprite_index, image_index,
	x + getShakeX(stun) * 2, y,
	image_xscale, image_yscale,
	ANGLE, COLOR, ALPHA
	);

if DEBUG
{
	draw_text(x, bbox_top, str(healthPoints, "/", healthPointsMax));
}