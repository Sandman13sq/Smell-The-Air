/// @desc Layer Checks & Camera

#region Layers

var _lyrArr = layer_get_all(), _lyrCount = array_length_1d(_lyrArr),
	_name, _lyr, _d = 0;

for (var _lyrIndex = 0; _lyrIndex < _lyrCount; _lyrIndex++)
{
	_lyr = _lyrArr[_lyrIndex];
	_name = layer_get_name(_lyr);
	
	if _name == "collision"
	|| _name == "coll"
	{
		var _tilemap = layer_tilemap_get_id(_lyr), _l, _w;
		
		STAGE_W = tilemap_get_width(_tilemap);
		STAGE_H = tilemap_get_height(_tilemap);
		_l = STAGE_W * STAGE_H;
		
		_w = STAGE_W;
		
		ds_grid_resize(STAGE_GRID, STAGE_W, STAGE_H);
		
		for (var i = 0; i < _l; i++)
		{
			STAGE_GRID[# i mod _w, i div _w] = tilemap_get(_tilemap, i mod _w, i div _w);
		}
		
		layer_set_visible(_lyr, false);
	}
	
	else if _name == "lightmap"
	{
		LIGHTMAP = layer_tilemap_get_id(_lyr);
		layer_depth(_lyr, Layer_Depth.lightmap);
		layer_set_visible(_lyr, false);
		
		var _w = tilemap_get_width(LIGHTMAP),
			_h = tilemap_get_height(LIGHTMAP),
			_val = isWindowClear()? 1: LIGHTMAP_MAX;
		
		for (var i = 0; i < _h; i++)
		{
			for (var j = 0; j < _w; j++)
			{
				if tilemap_get(LIGHTMAP, j, i) == 0
				{
					tilemap_set(LIGHTMAP, _val, j, i);
				}
			}
		}
	}
	
	else if _name == "Background"
	{
		layer_set_visible(_lyr, false);
	}
	else if layer_get_element_type(layer_get_element(_lyr, 0)) == layerelementtype_tilemap
	{
		layer_depth(_lyr, Layer_Depth.BG + _d);
		_d++;
	}
	else if layer_get_element_type(layer_get_element(_lyr, 0)) == layerelementtype_instance
	{
		var _map = ds_map_create(), _d = layer_get_depth(_lyr);
		
		ds_map_destroy(_map);
		
		with obj_bk {depth = Layer_Depth.outside;}
	}
}

#endregion

inst_create_singleton(obj_bk)

// Camera
setCameraBounds(0, 0, room_width, room_height);

view_enabled = true;
view_visible[view_current] = true;

view_set_wport(view_current, CAMERA_W);
view_set_hport(view_current, CAMERA_H);

camera = camera_create_view(0, 0, CAMERA_W, CAMERA_H);
view_set_camera(view_current, camera);
camera_apply(camera);

if !getGameFlag(Game_Flag.gameStart) {return;}

var _key = ds_map_find_first(WINDOW_MAP);

while ds_map_exists(WINDOW_MAP, _key)
{
	with obj_window
	{
		if windowKey == _key {setState(ST_window.open);}
	}
	
	_key = ds_map_find_next(WINDOW_MAP, _key);
}

deactivateEnemies();

// Spawn Player
var _l = instance_number(obj_spawnMarker), 
	_index = playerPositionIndex, _spawned = false;

for (var i = 0; i < _l; i++)
{
	with instance_find(obj_spawnMarker, i)
	{
		if index == _index
		{
			event_user(0);
			_spawned = true;
			break;
		}
	}
}

if !_spawned
{
	cout("No spawn found. Index = ", _index);
	//instance_create_depth(room_width / 2, room_height / 2, 0, obj_player);
}
else
{
	cameraSnapToPlayer();
}

// Level Start
if !getGameFlag(Game_Flag.levelStart)
{
	with inst_create(obj_roomTrigger)
	{
		state = 3;
		fadePosition = 1;
	}
	
	if instance_exists(obj_spawnMarker)
	{
		inst_create(obj_lightPhaseIn);
	}
	
	bgm(mus_outside);
}

if getGameFlag(Game_Flag.lightUpgradePre)
{
	inst_create(obj_lightUpgrade);
}

instance_destroy(obj_spawnMarker);