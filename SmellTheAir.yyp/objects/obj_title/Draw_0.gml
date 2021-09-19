/// @desc 

draw_self();

draw_set_align(0, 0);

if state == 4
{
	draw_set_align(1, 0);
	draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 0, 0.5);
	Dtext(CAMERA_X_CENTER, 100, "Erase save data?", c_white);
	
	var _histep = boolStep(CURRENT_FRAME, 8);
	Dtext(CAMERA_X_CENTER - 40, 160, "No", (eraseSelect == 0 && _histep)? LIGHTCOLOR: c_white);
	Dtext(CAMERA_X_CENTER + 40, 160, "Yes", (eraseSelect == 1 && _histep)? LIGHTCOLOR: c_white);
	
	return;
}

// Text
var _x = 200, _y = 180;
for (var i = 0; i < 3; i++)
{
	Dtext(_x, _y, choiceString[i], select[0] == i? c_yellow: c_white);
	_y += 16;
}

if !getGameFlag(Game_Flag.completedOnce) {return;}

// Leaderboard
var _x = 368, _y = 32, _data, _col;

Dtext(_x, _y - 16, "Records ", c_white);
drawMiniStar(_x + 60, _y - 16, starFlagFlag(recordSelect), 0);

draw_shape_rectWH(_x - 8, _y - 4, 108, 1, c_light, 1);

for (var i = 0; i < recordCount; i++)
{
	_data = ds_list_find_value(recordList[recordSelect], i);
	
	_col = c_white;
	if _data[0] < time_val(1, 30, 0) {_col = sub130Color;}
	else if _data[0] < time_val(2, 0, 0) {_col = sub200Color;}
	
	Dtext(_x, _y, string_time( _data[0] ), _col);
	drawMiniStar(_x + 56, _y, _data[1], 1);
	_y += 14;
}

// Dream Stars
var _sub = CURRENT_FRAME div 6;

var _x = 3, _y = 8;
draw_set_align(0, 1);
for (var i = 0; i < starCount; i++)
{
	// Opaque
	if starFlag & (1 << i)
	{
		drawDreamStar(_x, _y, _sub + i * 7, starColor[i], merge_color(starColor[i], 0, 0.5), 1, 1);
		Dtext(_x + 32, _y + 16, starLabel[i], c_white);
	}
	// Faded
	else if (i <= starMax && i < 4) || (starFlag & 0xF == 0xF)
	{
		drawDreamStar(_x, _y, _sub + i * 7, starColor[i], 0, 0, 0.3);
		draw_shape_text(_x + 32, _y + 16, starLabel[i], c_white, 0.5);
	}
	
	_y += 34;
}
