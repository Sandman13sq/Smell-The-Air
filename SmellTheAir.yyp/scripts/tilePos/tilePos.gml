/// @desc Returns first open position if tile exists. Undefined otherwise
/// @arg x,y,side
function tilePos(argument0, argument1, argument2) {

	enum Tile_Side 
	{
		l, u, r, d,
	
		top = Tile_Side.u,
		bottom = Tile_Side.d,
	}

	var _x = argument0, _y = argument1, 
		_side = argument2, _tile = tileAt(_x, _y);

	switch(_tile)
	{
		case(1):
			switch(_side)
			{
				case(Tile_Side.u): return quantize(_y, UNIT_PX); break;
				case(Tile_Side.d): return quantize(_y, UNIT_PX) + UNIT_PX; break;
				case(Tile_Side.l): return quantize(_x, UNIT_PX); break;
				case(Tile_Side.r): return quantize(_x, UNIT_PX) + UNIT_PX; break;
			}
			break;
	}

	if _side == Tile_Side.u
	|| _side == Tile_Side.d
	{
		return _y;
	}

	return _x;


}
