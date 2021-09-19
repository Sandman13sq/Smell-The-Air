/// @desc Update State

switch(state)
{
	case(-ST_shade.phaseIn):
		with obj_bossEvent {other.stepSpeed = stepSpeed;}
		step = 0;
		break;
	
	case(ST_shade.phaseIn):
		var _time = 120, _timeH = _time * 0.5;
		
		step += stepSpeed;
		
		if step < _time
		{
			if ALPHA < 1 {ALPHA = lerp(0, 1, unitStep(step / _timeH, 4));}
			else
			{
				COLOR = merge_color(0, c_white, unitStep((step - _timeH) / _timeH, 4));
			}
			
			healthState = 1;
			
		} else {setState(ST_shade.healStart);};
		break;
	
	#region Heal Start
	
	case(-ST_shade.healStart):
		step = 30;
		break;
		
	case(ST_shade.healStart):
		step -= stepSpeed;
		
		if step <= 0
		{
			step = 4;
			healthPoints = approach(healthPoints, healthPointsMax, 1);
			
			if healthPoints == healthPointsMax
			{
				setState(0);
			}
		}
		break;
	
	#endregion
	
	#region Hurt
	
	case(-ST_shade.hurt):
		iFrames = iFrameTime;
		break;
	
	case(ST_shade.hurt):
		setState(ST_shade.fly);
		break;
	
	#endregion
	
	#region Fly
	
	case(-ST_shade.fly):
		switch(getRNG() mod 4)
		{
			case(0): step = 40; break;
			case(1): step = 60; break;
			case(2): step = 70; break;
			case(3): step = 100; break;
		}
		
		setAnimation(Animation_Index.shade_fly);
		x_speed = (CAMERA_X_CENTER - x) / 80;
		if x_speed = 0 {x_speed = 1;}
		else if abs(x_speed) > 6 {x_speed = mag(x_speed, 6);}
		y_speed = -1;
		shootable = true;
		break;
	
	case(ST_shade.fly):
		if (step--) > 0
		{
			var _hoverY = 112, _xrange = 48, _yrange = 2;
			
			if !in_range(y, _hoverY - _yrange, _hoverY + _yrange)
			{y_speed = approach(y_speed, sign(_hoverY - y) * (y > _hoverY? 2: 1), 0.06);}
			
			if !in_range(x, getPlayerX() - _xrange, getPlayerX() + _xrange)
			{x_speed = approach(x_speed, signToPlayerX(), 0.05);}
			
			image_xscale = signToPlayerX();
			
			if COLOR != c_white
			{
				COLOR += 0x111111;
			}
		}
		else 
		{
			switch(getRNG() mod 2)
			{
				case(0): setState(ST_shade.fake_start); break;
				case(1): setState(ST_shade.dash_fly); break;
			}
			
		}
		break;
	
	case(-ST_shade.fly_return):
		setAnimation(Animation_Index.shade_spin);
		sfx_at(snd_airdash);
		x = CAMERA_X_CENTER;
		y = -64;
		step = 0;
		x_speed = 0;
		y_speed = 0;
		COLOR = c_white;
		ALPHA = 1;
		break;
	
	case(ST_shade.fly_return):
		if (step++) == 100
		{
			part_particles_create_color(
				PART_SYS, 
				lerp(bbox_left, bbox_right, 0.5),
				lerp(bbox_top, bbox_bottom, 0.5),
				PART_TYPE[Part_Type.dashCircle], 0, 1);
			COLOR = 0;
			sfx_at(snd_airdash);
			setState(ST_shade.fly);
		}
		else
		{
			y = intpl_para(-20, 112, rangeToAmt(step, 0, 50));
		}
		break;
	
	#endregion
	
	#region Fake
	
	case(-ST_shade.fake_start):
		step = 0;
		fakeCount = 3 + (getRNG() mod 3);
		break;
	
	case(ST_shade.fake_start):
		if (step++) == 40
		{
			setState(ST_shade.fake_flyUp);
		}
		else
		{
			if step == 20
			{
				setAnimation(Animation_Index.shade_spin);
				sfx_at(snd_airdash);
				shootable = false;
			}
			
			COLOR = merge_color(c_white, 0, rangeToAmt(step, 0, 15));
			x_speed = approach(x_speed, 0, 0.01);
			y_speed = approach(y_speed, 0, 0.01);
		}
		break;
	
	case(-ST_shade.fake_flyUp):
		step = 0;
		x_speed = 0;
		y_speed = 5;
		sfx_at(snd_airdash);
		break;
	
	case(ST_shade.fake_flyUp):
		y_speed -= 0.25;
		
		if y < 0
		{
			if (step++) == 20 {setState(ST_shade.fake_appear);}
		}
		break;
	
	case(-ST_shade.fake_appear):
		step = 0;
		x_speed = 0;
		y_speed = 0;
		ALPHA = 0;
		fakeCount--;
		shootable = false;
		setAnimation(Animation_Index.shade_shoot);
		
		var _y = 240, _x1 = 512, _x2 = 864, _xscale = 1;
		
		if getRNG() mod 2
		{
			var _temp = _x1; _x1 = _x2; _x2 = _temp;
			_xscale = -_xscale;
		}
		
		x = _x1; y = _y;
		image_xscale = _xscale;
		
		with instance_create_depth(_x2, _y, depth, obj_shadeFake)
		{
			image_xscale = -_xscale;
		}
		
		sfxCut(snd_chargeStart);
		break;
	
	case(ST_shade.fake_appear):
		if (step++) < 140
		{
			COLOR = merge_color(0, c_white, rangeToAmt(step, 70, 80));
			
			if step == 100
			{
				with instance_create_depth(x + image_xscale * 16, y - 32, depth, obj_carpetShot)
				{
					x_speed = other.image_xscale * 3;
				}
				
				part_particles_create_color(PART_SYS,
					x + image_xscale * 16, y - 32, PART_TYPE[Part_Type.dashCircle], c_shade, 1
					);
				
				sfx_at(snd_chargeShot, x, y);
			}
			
			if step <= 100
			{
				ALPHA = unitStep(rangeToAmt(step, 0, 60), 4);
				if step > 10 && step mod 6 == 0 {sfxCut(snd_carpetCharge);}
			}
			else 
			{
				ALPHA = unitStep(rangeToAmt(step, 140, 100), 4);
			}
			
			shootable = (COLOR != 0) && (ALPHA >= 0.2);
		}
		else
		{
			instance_destroy(obj_shadeFake);
			
			if fakeCount > 0 {setState(ST_shade.fake_appear);}
			else {setState(ST_shade.fly_return);}
		}
		break;
	
	#endregion
	
	#region Dash
	
	case(-ST_shade.dash_fly):
		step = 50;
		break;
	case(ST_shade.dash_fly):
		if (step--) > 0
		{
			var _hoverY = 112, _xrange = 48, _yrange = 2;
			
			if !in_range(y, _hoverY - _yrange, _hoverY + _yrange)
			{y_speed = approach(y_speed, sign(_hoverY - y), 0.06);}
			
			x_speed = approach(x_speed, pol(x > CAMERA_X_CENTER) * 3, 0.8);
			
			image_xscale = signToPlayerX();
		}
		else {setState(ST_shade.dash_drop);}
		break;
	
	case(-ST_shade.dash_drop):
		setAnimation(Animation_Index.shade_slash0);
		x_speed = 0;
		y_speed = -1.5;
		break;
	
	case(ST_shade.dash_drop):
		if step++ == 4 {create_afterimage(2, 2, c_shade, 1); step = 0;}
		
		if y < 240 {y_speed += 0.3;}
		else {setState(ST_shade.dash_dash);}
		break;
	
	case(-ST_shade.dash_dash):
		setAnimation(Animation_Index.shade_slash0);
		x_speed = image_xscale * 6.5;
		y_speed = 0;
		step = 0;
		break;
	
	case(ST_shade.dash_dash):
		if collision_rectangle(
			x, bbox_top, x + image_xscale * 48, bbox_bottom, 
			getPlayerInst(), 0, 0)
		|| signToPlayerX() != sign(image_xscale)
		{
			setAnimation(Animation_Index.shade_slash1);
			with instance_create_depth(x, y - 30, depth - 1, obj_shadeSlash)
			{image_xscale = other.image_xscale;}
			state = ST_shade.dash_slash;
		}
	
	case(ST_shade.dash_slash):
		if (step++) < 60
		{
			if step mod 4 == 0 {create_afterimage(2, 2, c_shade, 1);}
		}
		else 
		{
			if in_range(x, CAMERA_X, CAMERA_X + CAMERA_W) {setState(ST_shade.fly);}
			else {setState(ST_shade.fly_return);}
		}
		break;
	
	#endregion
	
	#region Defeat
	
	case(-ST_shade.defeat_air):
		x_speed = phys_findVelocity(x, CAMERA_X_CENTER, 30, 0);
		y_speed = phys_findVelocity(bbox_bottom, 240, 30, 0.2);
		image_xscale = pol(x_speed);
		bgm_fadeout(100);
		with obj_dustbunny 
		{
			instance_create_depth(x, y, depth + 1, obj_defeatFlash);
			sfx_at(snd_defeat, x, y);
			createEnemyKo(3);
		}
		instance_destroy(obj_shadeFake);
		instance_destroy(obj_carpetShot);
		setAnimation(Animation_Index.shade_defeat);
		clearFlag(Entity_Flag.hostile);
		clearGameFlag(Game_Flag.runTimer);
		inst_create(obj_bossEndEvent);
		
		ALPHA = 1;
		COLOR = c_white;
		break;
	
	case(ST_shade.defeat_air):
		y_speed += 0.2;
		
		if y_speed > 0 && tileAt(x, bbox_bottom)
		{
			y = tilePos(x, bbox_bottom, Tile_Side.top);
			setState(ST_shade.defeat_down);
		}
		break;
	
	case(-ST_shade.defeat_down):
		y_speed = 0;
		setAnimation(Animation_Index.shade_down);
		break;
	
	case(ST_shade.defeat_down):
		if x_speed != 0
		{
			x_speed *= 0.9;
			if abs(x_speed) < 0.1 {x_speed = 0}
		}
		break;
	
	case(-ST_shade.defeat_idle):
		setAnimation(Animation_Index.shade_idle);
		step = 0;
		healthState = 0;
		break;
	
	case(ST_shade.defeat_idle):
		if step++ < 100
		{
			COLOR = merge_color(c_white, 0, rangeToAmt(step, 40, 80));
		}
		else {setState(ST_shade.defeat_leave);}
		break;
	
	case(-ST_shade.defeat_leave):
		setAnimation(Animation_Index.shade_spin);
		sfx_at(snd_airdash);
		y_speed = 2;
		break;
	
	case(ST_shade.defeat_leave):
		if y <= -64
		{
			instance_destroy();
		}
		else {y_speed -= 0.3;}
		break;
	
	#endregion
}