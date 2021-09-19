/// @desc Sets camera bounds
/// @arg x1,y1,x2,y2
function setCameraBounds(argument0, argument1, argument2, argument3) {

	var _x1 = argument0, _y1 = argument1,
		_x2 = argument2, _y2 = argument3;

	if (_x2 - _x1) < CAMERA_W
	{
		cameraBound[0] = -(CAMERA_W - (_x2 - _x1) ) / 2;
		cameraBound[2] = cameraBound[0];
	}
	else
	{
		cameraBound[0] = _x1;
		cameraBound[2] = quantize_c(_x2 - CAMERA_W, UNIT_PX);
	}

	if (_y2 - _y1) < CAMERA_H
	{
		cameraBound[1] = -(CAMERA_H - (_y2 - _y1) ) / 2;
		cameraBound[3] = cameraBound[1];
	}
	else
	{
		cameraBound[1] = _y1;
		cameraBound[3] = quantize_c(_y2 - CAMERA_H, UNIT_PX);
	}

	//cout(cameraBound)


}
