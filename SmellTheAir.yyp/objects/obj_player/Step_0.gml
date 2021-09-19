/// @desc 

BAIL_CODE 

var _airLast = getFlag(Player_Flag.inAir),
	_shootAnim = Animation_Index.light_shoot;

if getFlag(Player_Flag.inAir) {_shootAnim = Animation_Index.light_jumpShoot;}
else if getFlag(Player_Flag.moving) {_shootAnim = Animation_Index.light_runShoot;}

//lightAir = approach(lightAir, 0, lightAirSpeed);
lightAirShow = lightAir / lightAirMax;

if iFrames > 0 {iFrames--;}
if bumpFrames > 0 {bumpFrames--;}

#region Charge GFX

if charge >= chargeTime * 0.5
{
	var _x = CURRENT_FRAME mod 3,
		_col = drawLightColor[0];
	
	if charge == chargeTime
	{
		rotateLightColors();
		chargeStep = (chargeStep + 1) mod colorCount;
		if CURRENT_FRAME mod 15 == 0 {_col = c_white;}
	}
	
	if CURRENT_FRAME mod 3 == 0
	{
		part_particles_create_color(
			PART_SYS, 
			irandom_range(x + x_left, x + x_right),
			irandom_range(y + y_up, y + y_down),
			PART_TYPE[Part_Type.charge], _col, 1
			);
	}
}

#endregion

event_user(14); // State Step

#region Charge SFX

if charge == chargeTime
{
	if chargeSound == -1
	{
		chargeSound = sfx_at(snd_chargeStart, x, y);
	}
	else if !audio_is_playing(chargeSound)
	{
		chargeSound = sfx_at(snd_charge, x, y, 0);
	}
}
else {chargeSound = -1;}

#endregion

image_xscale = pol(getFlag(Player_Flag.facingRight));

x += x_speed;
y += y_speed;

#region Collision

#region Entity Collision (Doors)

var _in = 4, _inst, _target = obj_door;

ds_list_clear(collisionList);
var _l = collision_rectangle_list( // Left Side
	bbox_left, bbox_top + _in, x + x_center, bbox_bottom - _in, 
	_target, 0, 1, collisionList, 0);
	
for (var i = 0; i < _l; i++)
{
	if (collisionList[| i].entityFlag & 1 << Entity_Flag.solid)
	{x = max(x, collisionList[| i].bbox_right - x_left + 1);}
}

ds_list_clear(collisionList);
var _l = collision_rectangle_list( // Right Side
	bbox_right, bbox_top + _in, x + x_center, bbox_bottom - _in, 
	_target, 0, 1, collisionList, 0);
	
for (var i = 0; i < _l; i++)
{
	if (collisionList[| i].entityFlag & 1 << Entity_Flag.solid)
	{x = min(x, collisionList[| i].bbox_left - x_right - 1);}
}

#endregion

var _x, _y, _xLast = x;

if tileAt(x, y + y_up)
&& y_speed < 0
{
	y = tilePos(x + x_center, y + y_up, Tile_Side.d) - y_up;
	y_speed = 0;
}

// Ground (Tile)
if tileAt(x, y + y_down)
&& y_speed >= 0
{
	y = tilePos(x, y + y_down, Tile_Side.u) - y_down;
	
	clearFlag(Player_Flag.inAir);
	y_speed = 0;
}
else
{
	setFlag(Player_Flag.inAir);
}

// LR Collision
_y = y + y_up + UNIT_PX;
if tileAt(x + x_right, _y) || tileAt(x + x_left, _y)
{
	if x_speed >= 0 x = tilePos(x + x_right, _y, Tile_Side.l) - x_right;
	if x_speed <= 0 x = tilePos(x + x_left, _y, Tile_Side.r) - x_left;
}

_y = y + y_center;
if tileAt(x + x_right, _y) || tileAt(x + x_left, _y)
{
	if x_speed >= 0 x = tilePos(x + x_right, _y, Tile_Side.l) - x_right;
	if x_speed <= 0 x = tilePos(x + x_left, _y, Tile_Side.r) - x_left;
}

if getFlag(Player_Flag.inAir)
{
	_y = y + y_down - 8;
	if tileAt(x + x_right, _y) || tileAt(x + x_left, _y)
	{
		if x_speed >= 0 x = tilePos(x + x_right, _y, Tile_Side.l) - x_right;
		if x_speed <= 0 x = tilePos(x + x_left, _y, Tile_Side.r) - x_left;
	}
}

if x != _xLast {x_speed = 0;}

var _lastRide = rideObject, _s = 8;

rideObject = noone;

// Ride Object
//if y_speed >= 0
{
	var _inst = collision_line(x, y + y_down, x, y + y_down + _s, obj_entity, 0, 1);

	if _inst
	{
		if in_range(y + y_down, _inst.bbox_top, _inst.bbox_top + _s)
		{
			if getBit(_inst.entityFlag, Entity_Flag.solid)
			{
				rideObject = _inst;
				
				if _inst != _lastRide && y_speed >= 0
				{
					lcl_on(rideObject, L.landOnTop);
				}
				
				y = _inst.bbox_top;
				clearFlag(Player_Flag.inAir);
				y_speed = rideObject.y_speed;
			}
		}
	}
}

// Air state changed in this frame
if _airLast != getFlag(Player_Flag.inAir)
{
	if state == ST_player.move
	{
		// Just In Air
		if getFlag(Player_Flag.inAir)
		{
			if animationIndex != Animation_Index.light_jump
			|| animationIndex != Animation_Index.light_jumpShoot
			{
				setAnimation(Animation_Index.light_jump);
			}
		}
		// Just Landing
		else
		{
			if tileAt(x, y + y_down + 1) {lastSolidPos = [x, y];}
			
			sfx_at(snd_jumpLand, x, y);
			
			clearFlag(Player_Flag.dashed);
			clearFlag(Player_Flag.chargeDashed);
		
			if animationIndex != Animation_Index.light_idle
			|| animationIndex != Animation_Index.light_shoot
			{
				if getInput(Input.left) || getInput(Input.right)
				{setAnimation(Animation_Index.light_run);}
				else {setAnimation(Animation_Index.light_idle);}
			}
		}
	}
}

#endregion