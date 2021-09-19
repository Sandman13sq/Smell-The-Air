/// @desc 

draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 0, 0.6);

var _x = CAMERA_W / 2, _y = 80, _arr;

draw_set_align(1, 1);

for (var i = 0; i < state; i++)
{
	_arr = resultList[| i];
	
	draw_shape_text(_x + 1, _y + 1, _arr[0], c_snes, 1);
	draw_shape_text(_x, _y, _arr[0], _arr[1], 1);
	
	_y += 20;
}