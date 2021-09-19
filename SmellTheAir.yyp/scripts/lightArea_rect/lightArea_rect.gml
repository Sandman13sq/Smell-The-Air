/// @desc Lights area in a circle
/// @arg x,y,range
function lightArea_rect(argument0, argument1, argument2) {

	var _s = argument2, _val,
		_cX = argument0 div UNIT_PX,
		_cY = argument1 div UNIT_PX,
		_xstart = max(0, _cX - _s), _xend = min(STAGE_W - 1, _cX + _s),
		_ystart = max(0, _cY - _s), _yend = min(STAGE_H - 1, _cY + _s);
		
		for (var i = _ystart; i <= _yend; i++)
		{
			for (var j = _xstart; j <= _xend; j++)
			{
				_val = tilemap_get(LIGHTMAP, j, i);
				
				if _val > 0
				{
					_val = min(_val, _val - ( (LIGHTMAP_MAX) - point_distance(_cX, _cY, j, i) ) );
				
					tilemap_set(
						LIGHTMAP, 
						clamp(_val, 1, LIGHTMAP_MAX),
						j, i
						);
				}
			}
		}


}
