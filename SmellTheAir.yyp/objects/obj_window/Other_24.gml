/// @desc State Update

switch(state)
{
	// Closed ======================================
	case(ST_window.closed):	// Update Only
		if place_meeting(x, y, PLAYER)
		{
			setState(ST_window.opening);
			sfx_at(snd_door);
		}
		break;
	
	// Opening =====================================
	case(-ST_window.opening):	// Change
		sfx_at(snd_door);
		WINDOW_MAP[? windowKey] = 0;
		if healthDropValue > 0 {dropHealth(healthDropValue);}
		break;
		
	case(ST_window.opening):	// Update
		if imageStep < 3
		{
			image_index = floor(imageStep);
			imageStep += 0.34;
		}
		else
		{
			setState(ST_window.open);
			
			var _l = instance_number(obj_window),
				_inst, _allOpen = true;
			
			for (var i = 0; i < _l; i++)
			{
				_inst = instance_find(obj_window, i);
				
				if _inst.state != ST_window.open {_allOpen = false; break;}
			}
			
			if _allOpen
			{
				ds_map_set(WINDOW_MAP, room_get_name(room), 1);
				instance_create_depth(x, y, 0, obj_clearLight);
				
				// All Windows Open
				if ds_map_exists(WINDOW_MAP, room_get_name(rm_inside1))
				&& ds_map_exists(WINDOW_MAP, room_get_name(rm_inside2))
				{
					setGameFlag(Game_Flag.allWindows);
					
					with MAIN_OBJ
					{
						healthPointsMax += 2;
						healthPoints += 2;
					}
					
					with PLAYER
					{
						healthPointsMax += 2;
						healthPoints += 2;
					}
				}
				sfx(snd_allClear);
			}
		}
		break;
	
	// Open	====================================
	case(-ST_window.open):	// Change Only
		image_index = 2; lightArea_circle(x, y, 200);
		break;
}