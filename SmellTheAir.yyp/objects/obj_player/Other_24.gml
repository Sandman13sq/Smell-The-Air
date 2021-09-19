/// @desc State Update

var _airLast = getFlag(Player_Flag.inAir),
	_shootAnim = Animation_Index.light_shoot;

if getFlag(Player_Flag.inAir) {_shootAnim = Animation_Index.light_jumpShoot;}
else if getFlag(Player_Flag.moving) {_shootAnim = Animation_Index.light_runShoot;}

switch(state)
{
	case(-ST_player.attributes):	// Change Only
		if getGameFlag(Game_Flag.lightUpgrade) 
		{
			shotCountMax = 3;
			drawLightColor[0] = lightColor[1];
		}
		else
		{
			drawLightColor[0] = lightColor[0];
		}
		
		resetLightColors();
		setState(ST_player.null);
		break;

	#region Movement
	
	case(-ST_player.move): // State Change
		if getFlag(Player_Flag.chargeDashHit)
		{
			iFrames = 30;
			clearFlag(Player_Flag.chargeDashHit);
		}
		
		if getFlag(Player_Flag.inAir) {setAnimation(Animation_Index.light_jump);}
		else if getInput(Input.right) || getInput(Input.left)
		{setAnimation(Animation_Index.light_run);}
		else {setAnimation(Animation_Index.light_idle);}
		break;
	
	case(ST_player.move): // Update
		if shotHold > 0 
		{
			shotHold--; 
			
			if shotHold <= 0
			{
				if !getFlag(Player_Flag.inAir) 
				{
					if getFlag(Player_Flag.moving) {setAnimation(Animation_Index.light_run, Animation_Flag.keepIndex);}
					else {setAnimation(Animation_Index.light_idle);}
				}
			}
		}
		
		var _lever = lever(getInput(Input.right), getInput(Input.left));
		
		if _lever != 0
		{
			updateFlag(Player_Flag.facingRight, _lever > 0);
		}
		
		#region Shcuut
		
		if shotDelay > 0 {shotDelay = approach(shotDelay, 0, 1);}
		else if shotCount < shotCountMax
		{
			// Fire Charged Chot
			if getInputBuffered(Input.fire, 6)
			{
				clearInputBuffered(Input.fire);
				
				var _posLever = pol(getFlag(Player_Flag.facingRight)),
					_cost = 1;
				
				shotCount++;
				
				// Create Projectile
				with instance_create_depth(
					x + x_center + _posLever * 20, y + y_center, depth, obj_playerProjectile)
				{
					x_speed = _posLever * 6;
					image_xscale = pol(x_speed);
					shotValue = _cost;
					COLOR = other.drawLightColor[0];
				}
				
				shotHold = 30;
				shotDelay = 10;
				
				sfx_at(snd_shot, x, y);
				
				// Update Animation
				if getFlag(Player_Flag.inAir)
				{
					setAnimation(Animation_Index.light_jumpShoot);
				}
				else
				{
					if getFlag(Player_Flag.moving) 
					{setAnimation(Animation_Index.light_runShoot, Animation_Flag.keepIndex);}
					else {setAnimation(Animation_Index.light_shoot);}
				}
			}
		}
		
		if getInputPressed(Input.fire)
		{
			charge = approach(charge, 0, 4);
		}
		
		#endregion
		
		#region Charge
		
		if charge == chargeTime
		{
			// Fire Charged Shot
			if !getInput(Input.fire)
			{
				resetLightColors();
				charge = 0;
				
				// Create Projectile
				var _posLever = pol(getFlag(Player_Flag.facingRight));
				
				with instance_create_depth(
					x + x_center + _posLever * width, y + y_center, depth, obj_playerProjectileCharged)
				{
					COLOR = other.drawLightColor[0];
					x_speed = _posLever * 7;
					image_xscale = _posLever;
				}
				
				// Create Particle
				part_particles_create_color(PART_SYS_BACK, 
					x + x_center, y + y_center, 
					PART_TYPE[Part_Type.dashCircle], drawLightColor[0], 1);
				
				setAnimation(_shootAnim, Animation_Flag.keepIndex);
				shotDelay = 20;
				shotHold = 30;
				
				audio_stop_sound(chargeSound);
				chargeSound = -1;
				
				sfx_at(snd_chargeShot, x, y);
			}
		}
		
		if !getFlag(Player_Flag.chargeDashed)
		{
			if getInput(Input.fire)
			{
				charge = approach(charge, chargeTime, 1);
			}
			else {charge = approach(charge, 0, 1);}
		}
		
		#endregion
		
		if getFlag(Player_Flag.inAir)
		{
			#region Air
			
			// Gravity
			y_speed = approach(y_speed, airGravMax, airGrav);
			
			if _lever != 0
			{
				// Move towards lever
				if abs(x_speed) < airMax || sign(x_speed) != _lever
				{
					x_speed = approach(x_speed, airMax * _lever, airAdd);
				}
				setFlag(Player_Flag.moving);
			}
			else
			{
				// Slow to a stop
				if x_speed != 0
				{
					x_speed = approach(x_speed, 0, airDrag);
				}
				clearFlag(Player_Flag.moving);
			}
			
			// Stop Ascent
			if !getFlag(Player_Flag.nonJump)
			{
				if getFlag(Player_Flag.jumpHold)
				{
					if !getInput(Input.jump)
					{
						clearFlag(Player_Flag.jumpHold);
					}
				}
				else
				{
					if y_speed < 0 {y_speed += 0.5;}
				}
			}
			
			// Dashing
			if !getInput(Input.up)
			{
				// Air Dash
				if !getFlag(Player_Flag.dashed)
				{
					if getFlag(Player_Flag.facingRight)
					{
						if getInput(Input.right) && getInputPressed(Input.jump)
						{
							setState(ST_player.dash);
							clearInputBuffered(Input.right);
						}
					}
					else
					{
						if getInput(Input.left) && getInputPressed(Input.jump)
						{
							setState(ST_player.dash);
							clearInputBuffered(Input.left);
						}
					}
				}
			
				// Charge Dash
				if charge == chargeTime
				|| (!getGameFlag(Game_Flag.lightUpgrade))
				{
					// if getInputBuffered(Input.down, 10)  && getInputPressed(Input.down) // Double tap
					if getInputPressed(Input.down)
					{
						if getGameFlag(Game_Flag.lightUpgrade)
						{
							setState(ST_player.chargeDash);
							sfx_at(snd_chargeShot, x, y);
						}
						else if !getFlag(Player_Flag.dashed)
						{
							setState(ST_player.dash);
						}
					}
				}
			}
			#endregion
		}
		else
		{
			#region Ground
			
			var _movingLast = getFlag(Player_Flag.moving);
			
			if _lever != 0
			{
				// Move towards lever
				if abs(x_speed) > walkMax
				{
					x_speed = approach(x_speed, walkMax * _lever, walkAdd * 0.5);
				}
				else
				{
					x_speed = approach(x_speed, walkMax * _lever, walkAdd);
				}
				
				setFlag(Player_Flag.moving);
			}
			else
			{
				// Slow to a stop
				if x_speed != 0
				{
					x_speed = approach(x_speed, 0, walkAdd);
				}
				clearFlag(Player_Flag.moving);
			}
			
			if _movingLast != getFlag(Player_Flag.moving)
			{
				if shotHold 
				{
					if getFlag(Player_Flag.moving)
					{setAnimation(Animation_Index.light_runShoot);}
					else {setAnimation(Animation_Index.light_shoot);}
				}
				else
				{
					if getFlag(Player_Flag.moving)
					{setAnimation(Animation_Index.light_run);}
					else {setAnimation(Animation_Index.light_idle);}
				}
			}
			
			// Yump
			if getInputPressed(Input.jump)
			|| getInputBuffered(Input.jump, 4)
			{
				if tileAt(x, y + y_down + 1) {lastSolidPos = [x, y];}
				
				clearInputBuffered(Input.jump);
				y_speed = -jumpHeight;
				sfx_at(snd_jump, x, y);
				if rideObject
				{
					if rideObject.y_speed < 0
					{
						y_speed += rideObject.y_speed * 1.5;
					}
				}
				setFlag(Player_Flag.jumpHold);
			}
			
			#endregion
		}
		
		break;
	
	#endregion =================================================
	
	#region Charge Dash
	
	case(-ST_player.chargeDash):	// Change
		dashing = dashTimeCharged;
		x_speed = dashSpeedCharged * pol(getFlag(Player_Flag.facingRight));
		y_speed = 0;
		
		setFlag(Player_Flag.chargeDashed);
		
		setAnimation(Animation_Index.light_dash);
		
		part_particles_create_color(PART_SYS_BACK, 
			x + x_center - pol(getFlag(Player_Flag.facingRight)) * width, 
			y + y_center, 
			PART_TYPE[Part_Type.dashWind], drawLightColor[0], 1);
		
		part_particles_create(PART_SYS_BACK, 
			x + x_center, y + y_center, 
			PART_TYPE[Part_Type.dashCircle], 1);
		
		ds_map_clear(dashedThroughMap);
		
		var _x = x + x_center, _xscale = image_xscale;
		with instance_create_depth(_x, y + y_up, depth + 1, obj_sneezWind) image_xscale = _xscale;
		with instance_create_depth(_x - image_xscale * 16, y + y_center, depth + 1, obj_sneezWind) image_xscale = _xscale;
		with instance_create_depth(_x, y + y_down, depth + 1, obj_sneezWind) image_xscale = _xscale;
		
		sfx_at(snd_airdash);
		break;
	
	case(ST_player.chargeDash):	// Update
		ds_list_clear(dashedThroughList);
		
		var _inst, _l = collision_rectangle_list(
			x + x_left, y + y_up, x + x_right, y + y_down,
			obj_enemy, 0, 1, dashedThroughList, 0
			);
		
		for (var i = 0; i < _l; i++)
		{
			_inst = dashedThroughList[| i];
			
			if !ds_map_exists(dashedThroughMap, _inst)
			{
				if doDamage(_inst, 5)
				{
					dashedThroughMap[? _inst] = 0;
					setHitStop(4);
					
					clearFlag(Player_Flag.chargeDashed);
					dashing = dashTimeCharged;
					
					// Wind Circle
					part_particles_create_color(PART_SYS_BACK, 
						x + x_center - pol(getFlag(Player_Flag.facingRight)) * width, 
						y + y_center, 
						PART_TYPE[Part_Type.dashWind], drawLightColor[0], 1);
					
					// Light Circle
					part_particles_create(PART_SYS_BACK, 
						x + x_center, y + y_center, 
						PART_TYPE[Part_Type.dashCircle], 1);
					
					setFlag(Player_Flag.chargeDashHit);
				}
			}
		}
		
		if (dashTimeCharged - dashing) > dashTimeMin
		{
			if !getInput(Input.down) {dashing = 0;}
		}
		
		if (dashing--)
		{
			if dashing mod 6 == 0
			{
				create_afterimage(1, 4, LIGHTCOLOR, 1);
			}
		}
		else
		{
			resetLightColors();
			setState(ST_player.move);
			charge = charge * bool(!getFlag(Player_Flag.chargeDashed));
			_airLast = -1;	// Force Animation Update
		}
		break;
		
	#endregion
	
	#region Dash
	
	case(-ST_player.dash):	// Change -------------------------
		dashing = dashTime;
		x_speed = dashSpeed * pol(getFlag(Player_Flag.facingRight));
		y_speed = 0;
		
		setAnimation(Animation_Index.light_dash);
		setFlag(Player_Flag.dashed);
		
		part_particles_create(PART_SYS_BACK, 
			x + x_center - pol(getFlag(Player_Flag.facingRight)) * width, 
			y + y_center, 
			PART_TYPE[Part_Type.dashWind], 1);
		
		var _x = x + x_center, _xscale = image_xscale;
		with instance_create_depth(_x, y + y_up, depth + 1, obj_sneezWind) image_xscale = _xscale;
		with instance_create_depth(_x - image_xscale * 16, y + y_center, depth + 1, obj_sneezWind) image_xscale = _xscale;
		with instance_create_depth(_x, y + y_down, depth + 1, obj_sneezWind) image_xscale = _xscale;
		
		sfx_at(snd_airdash);
		break;
	
	case(ST_player.dash):	// Update -----------------------------
		if (dashTime - dashing) > dashTimeMin
		{
			if !getInput(Input.jump) && !getInput(Input.down) 
			{dashing = 0;}
		}
		
		if dashing {dashing--;}
		else
		{
			setState(ST_player.move);
		}
		break;
	
	#endregion
	
	#region Hurt
	
	case(-ST_player.hurt):	// Change
		x_speed = -pol(Player_Flag.facingRight);
		y_speed = 0;
		setAnimation(Animation_Index.light_hurt);
		iFrames = iFrameTime;
		break;
	
	case(ST_player.hurt):	// Update
		if healthPoints == 0 {setState(ST_player.defeat_fly);}
		else {setState(ST_player.move);}
		break;
	
	#endregion
	
	#region Event Walk
	
	case(-ST_player.eventWalk):	// Change -------------------
		x_speed = 0;
		
		if getFlag(Player_Flag.inAir) {setAnimation(Animation_Index.light_jump);}
		else {setAnimation(Animation_Index.light_idle);}
		break;
	
	case(ST_player.eventWalk):	// Update -------------------
		var _movingLast = getFlag(Player_Flag.moving),
			_airLast = getFlag(Player_Flag.inAir);
		
		updateFlag(Player_Flag.moving, x_speed != 0);
		
		// Gravity
		y_speed = approach(y_speed, airGravMax, airGrav);
		
		if x_speed != 0
		{
			updateFlag(Player_Flag.facingRight, x_speed > 0);
		}
		
		if tileAt(x, bbox_bottom + 1)
		{
			if getFlag(Player_Flag.moving) {setAnimation(Animation_Index.light_run);}
			else {setAnimation(Animation_Index.light_idle);}
		}
		else
		{
			setAnimation(Animation_Index.light_jump);
		}
		break;
	
	#endregion
	
	#region Defeat
	
	case(-ST_player.defeat_fly):
		bgm_fadeout(100);
		
	case(-ST_player.defeat_fly2):
		setAnimation(Animation_Index.light_defeatBounce);
		if abs(x_speed) < 2
		{
			x_speed = -pol(getFlag(Player_Flag.facingRight)) * 2;
		}
		y_speed = -2;
		setFlag(Player_Flag.inAir);
		break;
	// ----------------------------------
	case(ST_player.defeat_fly):
	case(ST_player.defeat_fly2):
		if !getFlag(Player_Flag.inAir)
		{
			if state == ST_player.defeat_fly {setState(ST_player.defeat_bounce);}
			else {setState(ST_player.defeat_dim);}
		}
		else {y_speed += 0.2;}
		break;
	
	// ----------------------------------
	case(-ST_player.defeat_bounce):
		x_speed = 0;
	case(-ST_player.defeat_dim):
		step = 0;
		setAnimation(Animation_Index.light_defeat);
		sfx_at(snd_hit);
		break;
	
	case(ST_player.defeat_bounce):
		step++;
		if step == 4 {setState(ST_player.defeat_fly2);}
		break;
	
	// Dimming -------------------------
	case(ST_player.defeat_dim):
		step++;
		y_speed += 0.2;
		
		x_speed = approach(x_speed, 0, 0.1);
		// Flicker
		if step > 30
		{
			if step < 120
			{
				if boolStep(step, 2) {setLightColor(0, 0);}
				else {setLightColor(0, drawLightColor[0]);}
				
				if irandom(5) && step mod 5 == 0 
				{sfxCut_at(snd_lightFlicker);}
			}
			else if step == 120
			{
				setLightColor(0, 0);
			}
		}
		
		if step == 220 {inst_create(obj_gameover);}
		break;
	
	// Falling off
	case(-ST_player.defeat_fall):
		sfx_at(snd_lightFall);
		bgm_fadeout(100);
		step = 0;
		x_speed = 0;
		y_speed = 0;
		break;
	
	case(ST_player.defeat_fall):
		if (step++) == 100 {inst_create(obj_gameover);}
		break;
	
	#endregion
	
	case(-ST_player.stuck):	// Change Only
		x_speed = 0;
		y_speed = 0;
		charge = 0;
		resetLightColors();
		setAnimation(Animation_Index.light_stucc);
		break;
	
}