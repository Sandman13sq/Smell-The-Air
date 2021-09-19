/// @desc Lights area in a circle
/// @arg x,y,range
function lightArea_circle(argument0, argument1, argument2) {

	var _x = argument0, _y = argument1, _r = argument2,
		_xstart = floor( (_x - _r) / UNIT_PX ), _xend = ceil( (_x + _r) / UNIT_PX ),
		_ystart = floor( (_y - _r) / UNIT_PX ), _yend = ceil( (_y + _r) / UNIT_PX ),
		_light, _val, _tileR = UNIT_PX * LIGHTMAP_MAX;

	for (var i = _ystart; i <= _yend; i++)
	{
		for (var j = _xstart; j <= _xend; j++)
		{
			_val = tilemap_get(LIGHTMAP, j, i);
		
			if _val > 0
			{
				_light = point_distance(_x, _y, tileCenter(j), tileCenter(i) );
			
				_light = (_r - _light) / _tileR;
				_light *= LIGHTMAP_MAX - 1;
				_light = LIGHTMAP_MAX - _light;
			
				_val = min(_val, _light );
				
				tilemap_set(
					LIGHTMAP, 
					clamp(_val, 1, LIGHTMAP_MAX),
					j, i
					);
			}
		}
	}

	/*
	var _s = argument2, _val,
		_cX = argument0 div UNIT_PX,
		_cY = argument1 div UNIT_PX,
		_xstart = max(0, _cX - _s), _xend = min(STAGE_W - 1, _cX + _s),
		_ystart = max(0, _cY - _s), _yend = min(STAGE_H - 1, _cY + _s);
	
	var _x = argument0, _y = argument1, _r = argument2,
		_cX, _cY
		
		for (var i = _ystart; i <= _yend; i++)
		{
			for (var j = _xstart; j <= _xend; j++)
			{
				_val = tilemap_get(LIGHTMAP, j, i);
				
				if _val > 0
				{
					_val = min(_val, _val - ( (LIGHTMAP_MAX - 1) - point_distance(_cX, _cY, j, i) ) );
				
					tilemap_set(
						LIGHTMAP, 
						clamp(_val, 1, LIGHTMAP_MAX),
						j, i
						);
				}
			}
		}

/* end lightArea_circle */
}
