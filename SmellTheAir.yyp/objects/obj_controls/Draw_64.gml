/// @desc 

draw_reset();

draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 1, 0.5);

var _x = 40, _ystart = 40, _y,
	_hiCol = boolStep(CURRENT_FRAME, 8)? c_white: LIGHTCOLOR,
	_inputArr = [MAIN_OBJ.inputKey, MAIN_OBJ.inputPad], _inputVal;

_y = _ystart;
	
draw_shape_boxWH(_x, _y, boxWidth, boxHeight, 4, 0, LIGHTCOLOR, 1);
	
draw_set_halign(1);
Dtext(_x + boxWidth * 0.5 - 80, _y - 16, label[0], (state == 0 && mode == 0)? _hiCol: c_white);
Dtext(_x + boxWidth * 0.5 + 80, _y - 16, label[1], (state == 0 && mode == 1)? _hiCol: c_white);
if state > 0
Dtext(CAMERA_W / 2, 240, "Press JUMP to Change Key/Button. Press MENU to add input", c_white);
	
if polling > 0
Dtext_ext(_x + boxWidth * 0.5, _y + 134, 
	"Press Key To Bind To\n\"" + inputName[inputSelect] + "\"\n" + string(ceil(polling / 60)), 
	c_white, 14, 200);
	
// Draw Inputs
_y += 8;
	
for (var i = 0; i < inputCount; i++)
{
	draw_set_halign(0);
	Dtext(_x + 16, _y, inputName[i], (inputSelect == i && state > 0)? _hiCol: c_white);
	_inputVal = array_get_ext(_inputArr, mode, i);
		
	draw_set_halign(2);
	var _inputKeyCount = array_length_1d(_inputVal), _str = "";
	for (var j = 0; j < _inputKeyCount; j++)
	{
		_str += getVirtualInputName(_inputVal[j]);
		if j < _inputKeyCount - 1 {_str += ", "}
	}
		
	Dtext(_x + boxWidth - 16, _y, _str, (inputSelect == i && state > 0)? _hiCol: c_white);
		
	draw_shape_rect_wh(_x + 16, _y + 13, boxWidth - 32, 1, c_white, 0.5);
		
	_y += 16;
}

// Cover with alpha
if state == 0
{draw_shape_rectWH(_x, _ystart, boxWidth, boxHeight, 0, 0.5);}
	
_x = CAMERA_W - boxWidth - _x;
