/// @desc 

// Inherit the parent event
event_inherited();

x_center = bbox_left + (bbox_right - bbox_left) / 2;
y_center = bbox_top + (bbox_bottom - bbox_top) / 2;

COLOR = 0;
ALPHA = 0;

setFlag(Entity_Flag.noDisable);
setFlag(Entity_Flag.hostile);

enum ST_shade
{
	preFight,
	phaseIn,
	healStart,
	idle,
	fly,
	fly_return,
	hurt,
	
	dash_fly,
	dash_drop,
	dash_dash,
	dash_slash,
	
	spin_start,
	spin_drop,
	spin_dash,
	
	fake_start,
	fake_flyUp,
	fake_appear,
	
	defeat_air,
	defeat_down,
	defeat_idle,
	defeat_leave,
}

state = 0;
step = 0;
stepSpeed = 1;

fakeCount = 0;

healthX = 128;
healthState = 0;

iFrames = 0;
iFrameTime = 120;
shootable = 0;

x_speed = 0;
y_speed = 0;

setupAnimation();
setAnimation(Animation_Index.shade_idle);