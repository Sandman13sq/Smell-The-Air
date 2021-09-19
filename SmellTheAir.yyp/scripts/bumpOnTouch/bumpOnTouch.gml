/// @desc 
/// @arg speed,player_speed
function bumpOnTouch(argument0, argument1) {

	var _speed = argument0,
		_playerSpeed = argument1;

	var _inst = instance_place(x, y, getPlayerInst());

	if _inst
	{
		// Exit Early
		with _inst 
		{
			if !getFlag(Player_Flag.inAir)
			|| state == ST_player.chargeDash
			|| state == ST_player.dash
			{return 0;}
		}
	
		// Check for bump
		var _bump = in_range(_inst.bbox_bottom, bbox_top, bbox_bottom - 4);
	
		if _bump
		{
			// Bump against player
			if _inst.y_speed >= 0.2
			{
				var _x = lerp(x, _inst.x, 0.5),
					_y = lerp(y, _inst.y, 0.5),
					_s = 8,
					_dir = point_direction(
						lerp(x, x, 0.5),
						lerp(y, y, 0.5),
						lerp(_inst.x, _inst.x, 0.5),
						lerp(_inst.y, _inst.y, 0.5)
						);
			
				_inst.x_speed = lengthdir_x(_playerSpeed, _dir);
				_inst.y_speed = lengthdir_y(_playerSpeed, _dir) * 2;
			
				with _inst 
				{
					setFlag(Player_Flag.jumpHold);
					bumpFrames = 2;
					if abs(x_speed) < 1 {x_speed = mag(x_speed, 1);}
				}
			
				if _speed >= 0
				{
					x_speed = -lengthdir_x(_speed, _dir);
					y_speed = -lengthdir_y(_speed, _dir);
				}
			
				part_particles_create_region(
					PART_SYS,
					_x - _s, _y - _s, _x + _s, _y + _s,
					PART_TYPE[Part_Type.bump0], c_white, 1
					);
		
				part_particles_create_region(
					PART_SYS,
					_x - _s, _y - _s, _x + _s, _y + _s,
					PART_TYPE[Part_Type.bump1], c_white, 1
					);
			
				sfx_at(snd_bump);
			
				return _inst;
			}
		}
	}

	return 0;


}
