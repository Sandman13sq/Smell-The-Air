/// @desc Get light Radii

var _ds = lightRadiusDS, _coll = collisionList, 
	_s = 64, _l,
	_camX = CAMERA_X, _camY = CAMERA_Y,
	_x1 = _camX - _s, _y1 = _camY - _s, 
	_x2 = _x1 + CAMERA_W + _s, _y2 = _y1 + CAMERA_H + _s;

// Make a list of all light radii in camera view
ds_list_clear(_coll);
ds_list_clear(_ds);

_l = collision_rectangle_list(_x1, _y1, _x2, _y2, obj_entity, 0, 1, _coll, 0);

for (var i = 0; i < _l; i++)
{
	with _coll[| i]
	{
		if lightRadius > 0
		{
			ds_list_add(_ds, [x - _camX, y - _camY, 32]);
		}
	}
}

with PLAYER
{
	if state != ST_player.null
	{
		ds_list_add(_ds, [x + x_center - _camX, y + y_center - _camY, 64 * lightAirShow]);
	}
}

lightRadiusSize = ds_list_size(lightRadiusDS);