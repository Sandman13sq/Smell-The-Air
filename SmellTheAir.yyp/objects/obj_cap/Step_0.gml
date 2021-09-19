/// @desc 

BAIL_CODE

var _xcheck = x_speed < 0? bbox_left: bbox_right,
	_ycheck = y_speed < 0? bbox_top: bbox_bottom;

if tileAt(_xcheck, y) {x_speed = -x_speed;}
if tileAt(_ycheck, y) {y_speed = -y_speed;}

// Interact with player
var _inst = instance_place(x, y, PLAYER);

if _inst
{
	// Bounce
	if in_range(_inst.bbox_bottom, y, bbox_top)
	&& _inst.y_speed >= 0
	{
		with _inst
		{
			y_speed = -jumpHeight;
			setFlag(Player_Flag.jumpHold);
			sfx_at(snd_capHop, x, y);
		}
	}
	else {doDamage(_inst, 1);}
}

// Bounce off other Caps
_inst = collision_rectangle(x, bbox_top, _xcheck, bbox_bottom, obj_cap, 0, 1);

if _inst
{
	_inst.x_speed = x_speed;
	x_speed = -x_speed;
}

var _div = 6;
imageStep = loop(imageStep + sign(x_speed), 0, _div * 8);
image_index = imageStep div _div mod 8;

x += x_speed;
y += y_speed;