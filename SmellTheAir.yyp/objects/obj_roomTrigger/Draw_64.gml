/// @desc 

var _y = 0;

for (var i = 0; i < blindCount; i++)
{
	draw_shape_rect(
		0, _y, CAMERA_W, _y + height * fadePosition,
		0x100000, 1
		);
	
	_y += height;
}