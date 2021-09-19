/// @desc 

var _col = COLOR;
if boolStep(step, 4) {_col = 0;}

draw_shape_rect(
	x - sizeShow, y - sizeShow,
	x + sizeShow, y + sizeShow,
	_col, 1);