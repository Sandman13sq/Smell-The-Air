/// @desc 

draw_shape_rect(0, 0, CAMERA_W, CAMERA_H, 0, 0.5);

draw_set_halign(2);
draw_set_valign(0);

switch(state)
{
	case(0):
		var _x, _y, _hsep = 20, _volW = 100, _h = 8, _vol,
			_col;

		for (var i = 0; i < pauseStringCount; i++)
		{
			if i == select && boolStep(CURRENT_FRAME, 8)
			{_col = LIGHTCOLOR;} else {_col = c_white;}
	
			_x = x;
			_y = y + i * _hsep;
			_vol = -1;
	
			Dtext(_x - 8, _y, pauseString[i], _col);
	
			switch(i)
			{
				case(0): _vol = VOLUME_ALL; break;
				case(1): _vol = VOLUME_BGM; break;
				case(2): _vol = VOLUME_SFX; break;
			}
			
			// Draw Volume
			if _vol != -1
			{
				draw_shape_rectWH(_x + 8, _y, _volW, _h, 0, 1);
				draw_shape_rectWH(_x + 8, _y, _vol, _h, LIGHTCOLOR, 1);
		
				Dtext(_x + _volW + 40, _y, _vol, _col);
			}
			
			// Draw Screen Res
			if i == 3
			{
				_x += 40;
				
				for (var j = 0; j < resCount; j++)
				{
					if j == cameraSize && 
					(boolStep(CURRENT_FRAME, 8) || state != 3)
					{_col = LIGHTCOLOR;} else {_col = c_white;}
					
					Dtext(_x, _y, resString[j], _col);
					_x += 24
				}
			}
		}
		break;
	
	default:
		draw_set_halign(1);
		Dtext(x, y - 10, selectString, c_white);
		
		var _flashCol = boolStep(CURRENT_FRAME, 8)? LIGHTCOLOR: c_white;
		
		Dtext(x - 16, y + 10, "YES", selectBool == 1? _flashCol: c_white);
		Dtext(x + 16, y + 10, "NO", selectBool == 0? _flashCol: c_white);
		
		break;
}