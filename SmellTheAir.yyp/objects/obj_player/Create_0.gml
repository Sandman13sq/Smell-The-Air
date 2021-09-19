/// @desc 

#macro PLAYER obj_player

enum Player_Flag
{
	inAir = 0,
	moving,
	facingRight,
	jumpHold,
	nonJump,	// Upwards speed not caused by jump
	dashed,
	chargeDashed,
	chargeDashHit,
	isOffscreen,
	chargeStart,
	chargeLoop
}

enum ST_player
{
	null = 0,
	phasingIn,
	hurt,
	move,
	eventWalk,
	dash,
	chargeDash,
	wall,
	stuck,
	attributes,
	
	defeat_fly,
	defeat_bounce,
	defeat_fly2,
	defeat_dim,
	defeat_fall,
}

depth = Layer_Depth.player;

COLOR = c_white;

flag = 0;
state = ST_player.move;
step = 0;
width = 13;
height = 46;

x_left = -width;
x_right = width;
y_up = -height;
y_down = 1;

x_center = lerp(x_left, x_right, 0.5);
y_center = lerp(y_up, y_down, 0.5);

#region Physics

x_speed = 0;
y_speed = 0;

airDrag = 0.1;
airGrav = 0.2;
airGravMax = 6;

walkAdd = 0.5;
walkMax = 2;
airAdd = 0.2;
airMax = walkMax;
moveAcc = 0.5;
jumpHeight = 5;

#endregion

setupAnimation();
setAnimation(Animation_Index.light_idle);

dashing = 0;
dashTime = 16; // Previously 12
dashTimeMin = 4;
dashSpeed = 3;
dashSpeedCharged = 4;
dashTimeCharged = 20;

charge = 0;
chargeTime = 48;
chargeStep = 0;
chargeSound = -1;

shotCount = 0;
shotCountMax = 2;
shotDelay = 0;
shotHold = 0;

lightAir = 1000;
lightAirMax = 1000;
lightAirShow = 1;

healthPoints = MAIN_OBJ.healthPoints;
healthPointsMax = MAIN_OBJ.healthPointsMax;

iFrames = 0;
iFrameTime = 100;
bumpFrames = 0;

dashedThroughMap = ds_map_create();
dashedThroughList = ds_list_create();	// Used in collision
collisionList = ds_list_create();	// Used in collision
rideObject = noone;

lastSolidPos = [x, y];

#region Colors

var _count = 8;
colorTarget = array_create(_count * 4);
colorLight = array_create(_count * 4);
lightColor = MAIN_OBJ.lightColor;

// Colors to replace
sourceLightColor = [
	bgr(0xFFFF00),	// Light
	bgr(0x0000FF),	// Outline
	bgr(0x000000),	// Black
	bgr(0xFFFFFF),	// Skin
	bgr(0x00FFFF)	// Pants
	];

// New Colors
/* Green 0xB2FFB6 */
drawLightColor = [
	lightColor[0],	// Light
	bgr(0x262626),	// Outline
	bgr(0x000000),	// Black
	bgr(0xF0FFFF),	// Skin
	bgr(0xF0FFFF)	// Pants
	];
	
colorCount = array_length_1d(drawLightColor);

setLightTarget(0, sourceLightColor[0]);
setLightTarget(1, sourceLightColor[1]);
setLightTarget(2, sourceLightColor[2]);
setLightTarget(3, sourceLightColor[3]);
setLightTarget(4, sourceLightColor[4]);

resetLightColors();

#endregion

setState(ST_player.attributes);
setState(ST_player.move);