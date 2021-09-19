/// @desc 

BAIL_CODE

if instance_exists(obj_pause) {return}

var _stepSpeed = (getInput(Input.fire))? 4: 1;

switch(state)
{
	case(0):
		if getInput(Input.jump) || getInput(Input.fire)
		{step = 0;}
		
		if step > 0 
		{
			step--; COLOR = boolStep(step, 10)? c_blue: c_white;
		}
		else
		{
			step = phaseTime;
			sfx_at(snd_upgradeEnd);
			state++;
		}
		break;
	
	case(1):
		if step > 0 
		{
			step = approach(step, 0, _stepSpeed);
			
			var _h = sprite_height * (step / phaseTime),
				_y = y - sprite_yoffset + _h, _s = 10;
			
			part_particles_create_region(
				PART_SYS,
				bbox_left - _s, _y, bbox_right + _s, _y,
				PART_TYPE[Part_Type.twinkleUp], phaseColor, 1
				);
		}
		else 
		{
			state++;
		}
		break;
	
	case(2):
		y_speed += 0.05 * _stepSpeed;
		y += y_speed;
		
		if tileAt(x, bbox_bottom)
		{
			with PLAYER
			{
				setState(ST_player.move);
			}
			
			setGameFlag(Game_Flag.levelStart);
			setGameFlag(Game_Flag.useInput);
			setGameFlag(Game_Flag.runTimer);
			sfx_at(snd_jumpLand);
			instance_destroy();
		}
		break;
}

updateAnimation();