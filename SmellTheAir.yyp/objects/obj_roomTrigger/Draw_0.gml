/// @desc Draw Nothing

if DEBUG
{
	draw_text(
		clamp(x, 16, room_width - 80),
		clamp(y, 16, room_height - 16),
		spawnIndex);
}