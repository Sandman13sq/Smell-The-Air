/// @desc State Update

switch(state)
{
	#region Idle
	
	case(-ST_sneez.idle):
		stateStep = 100;
		setAnimation(Animation_Index.sneez_idle);
		break;
		
	case(ST_sneez.idle):
		image_xscale = signToPlayerX();
		
		var _inst = instance_place(x, y, obj_sneez);
		
		if _inst {doDamage(_inst, 1)}
		
		if stateStep {stateStep--;}
		else
		{
			// Begin
			if collision_rectangle(
				x, bbox_bottom, 
				x + range * image_xscale, bbox_top, 
				PLAYER, 0, 1)
			{
				setState(ST_sneez.succ);
			}
		}
		
		bumpOnTouch(-1, 2);
		break;
	
	#endregion
	
	#region Succ
	
	case(-ST_sneez.succ):
		strengthAmt = 0;
		setAnimation(Animation_Index.sneez_succ);
		stateStep = 300;
		break;
	
	case(ST_sneez.succ):
		
		if stateStep 
		{
			stateStep--;
			stun = 2 + boolStep(stateStep, 3);
			
			// Stucc
			var _inst = instance_place(x, y, getPlayerInst());
			
			if _inst 
			{
				if _inst.iFrames == 0
				&& _inst.state != ST_player.chargeDash
				&& _inst.healthPoints > 0
				{
					playerInst = _inst;
					setState(ST_sneez.stucc);
				}
			}
			else
			{
				if stateStep mod 15 == 0 && stateStep >= 20
				{
					sfx_at(snd_succ, x, y);
				}
			}
			
			// Particles
			if stateStep mod 3 == 0
			{
				with instance_create_depth(
					irandom_range(x, x + range * image_xscale), 
					irandom_range(bbox_bottom, bbox_top - 64),
					0, obj_sneezWind)
				{
					image_xscale = -other.image_xscale;
				}
			}
		}
		else {setState(ST_sneez.shoot);}
		break;
	
	#endregion
	
	#region Stucc
	
	case(-ST_sneez.stucc):
		setAnimation(Animation_Index.sneez_stucc);
		stun = 20;
		stateStep = 55;
		
		audio_stop_sound(snd_succ);
		sfx_at(snd_stucc, x, y);
		
		with playerInst
		{
			x = other.x - 3 * other.image_xscale; 
			y = other.y - 19;
			updateFlag(Player_Flag.facingRight, other.image_xscale != 1);
			setState(ST_player.stuck);
		}
		break;
	
	case(ST_sneez.stucc):
		if stateStep {stateStep--;} else {setState(ST_sneez.shoot);}
		break;
	
	#endregion
	
	#region Shoot
	
	case(ST_sneez.shoot):
		bumpOnTouch(-1, 2);
		if stateStep {stateStep--;} else {setState(ST_sneez.idle);}
		break;
	
	case(-ST_sneez.shoot):
		// Shoot Player
		if playerInst
		{
			doDamage(playerInst, 2);
			playerInst.x = x + image_xscale * 32;
			playerInst.y = y + 4;
			playerInst.x_speed = image_xscale * 6;
			playerInst.y_speed = -4;
		
			playerInst = noone;
		}
		
		var _x = x + image_xscale * 10, _y = y - 12,
			_facingRight = image_xscale == 1, _l = 3,
			_angle = _facingRight? [-10, 45]: [190, 135];
		
		part_particles_create_color(
			PART_SYS, _x, _y, PART_TYPE[Part_Type.dashCircle], c_sneez, 1);
		
		for (var i = 0; i < _l; i++)
		{
			with instance_create_depth(_x, _y, depth - 5, obj_sneezDrop)
			{
				direction = lerp(_angle[0], _angle[1], i / (_l - 1));
			}
		}
		
		setAnimation(Animation_Index.sneez_shoot);
		audio_stop_sound(snd_succ);
		sfx_at(snd_sneezShoot, x, y);
		stateStep = 90;
		break;
	
	#endregion
}