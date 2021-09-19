/// @desc 

depth = Layer_Depth.lightmap;

inst_create(obj_artist);

init_game();

ini_open("settings.ini");

lightColor = [
	bgr(hexToInt(ini_read_string("data", "light1", "0xA3AAFF")) ),
	bgr(hexToInt(ini_read_string("data", "light2", "0xFFFF00")) )
	];

shader_set(shd_default);
display_set_gui_size(CAMERA_W, CAMERA_H);

cameraSize = ini_read_real("data", "screenmode", 2);
if !window_get_fullscreen() {event_user(0);}

#region Music

VOLUME_ALL = ini_read_real("data", "volume_all", 40);
VOLUME_BGM = ini_read_real("data", "volume_bgm", 40);
VOLUME_SFX = ini_read_real("data", "volume_sfx", 50);

audio_master_gain(VOLUME_ALL / 100);
audio_listener_orientation(0, 1, 0, 0, 0, 1);

musicCurrent = -1;

#endregion

#region Macros

#macro MAIN_OBJ obj_main

#macro UNIT_PX 16
#macro c_snes 0x262626
#macro c_light 0xF0F0F0
#macro c_shade 0xAC009B
#macro COLOR image_blend
#macro ANGLE image_angle
#macro ALPHA image_alpha
#macro CURRENT_FRAME global.CurrentFrame

#macro CAMERA_X global.CameraX
#macro CAMERA_Y global.CameraY
#macro CAMERA_X_CENTER (CAMERA_X + CAMERA_W * 0.5)
#macro CAMERA_Y_CENTER (CAMERA_Y + CAMERA_H * 0.5)
#macro CAMERA_W 480
#macro CAMERA_H 270

#macro FONT_MAIN_OBJ global.FontMain

#macro STAGE_GRID global.StageGrid
#macro STAGE_W global.StageWidth
#macro STAGE_H global.StageHeight
#macro LIGHTMAP global.LightGrid
#macro LIGHTMAP_MAX 5

#macro DEBUG global.Debug

#macro GAMEFLAG global.GameFlag

#macro VOLUME_ALL global.Volume_All
#macro VOLUME_BGM global.Volume_BGM
#macro VOLUME_SFX global.Volume_SFX

#macro HITSTOP global.HitStop
#macro BAIL_CODE if HITSTOP > 0 || GAMEFLAG & 1 {return;}

#macro WINDOW_MAP global.WindowMap

#macro LIGHTCOLOR global.LightColor

DEBUG = 0;
HITSTOP = 0;

STAGE_W = 16;
STAGE_H = 16;
STAGE_GRID = ds_grid_create(STAGE_W, STAGE_H);

LIGHTMAP = -1;
LIGHTCOLOR = lightColor[0];

CAMERA_X = 0;
CAMERA_Y = 0;

#endregion

#region Light Shader

#macro UNI_LIGHT_COL_TARGET global.Uni_Light_Target
#macro UNI_LIGHT_COL_LIGHT global.Uni_Light_Color

UNI_LIGHT_COL_LIGHT = shader_get_uniform(shd_light, "u_colLight");
UNI_LIGHT_COL_TARGET = shader_get_uniform(shd_light, "u_colTarget");

#endregion

#region enum Key

enum Key
{
	tilde = 192,
	greaterThan = 188,
	lessThan = 190
}

#endregion

structorInput();
structorParticle(1);
structorAnimation(1);
structorEvent(1);
structorRandom(1);

WINDOW_MAP = ds_map_create();

#region Game Flag Enum

enum Game_Flag
{
	pauseAction,
	inside,
	lightUpgrade,
	lightUpgradePre,
	gameStart,
	levelStart,
	useInput,
	cameraFollow,
	runTimer,
	
	allWindows,
	noWindows,
	damageTaken,
	enemyDefeated,
	enemyDamaged,
	completedOnce,
	
	debugStart,
}

#endregion

enum Layer_Depth
{
	player = -50,
	enemy = -10,
	FG = -100,
	BG = 100,
	outside = 1000,
	lightmap = -200,
}

CURRENT_FRAME = 0;
GAMEFLAG = 0;

setGameFlag(Game_Flag.useInput);
setGameFlag(Game_Flag.cameraFollow);

var _str = ""; for (var i = 32; i <= 127; i++) {_str += chr(i);}

FONT_MAIN_OBJ = font_add_sprite_ext(spr_dreamfont, _str, 1, 1);

draw_set_font(FONT_MAIN_OBJ);

camera = -1;
cameraBound = [0, 0, 0, 0];

healthPointsMax = 6;
healthPoints = healthPointsMax;

playerPositionIndex = 0;

playTime = 0;
playTimeString = string_time(playTime);

starFlag = ini_read_string("data", "starflag", 0);
if ini_read_real("data", "completedOnce", 0)
{
	setGameFlag(Game_Flag.completedOnce);
}

// Read Records
recordList = array_create(12);

var _l = 6, _subL;
for (var i = 0; i < _l; i++) // Objective Records
{
	_subL = i == 0? 8: 5;
	recordList[i] = ds_list_create();
	
	for (var j = 0; j < _subL; j++)
	{
		ds_list_set(recordList[i], j, [
			ini_read_real("record" + string(i) + chr(ord("a") + j), "time", time_val(3 + j, 0, 0) ),
			ini_read_string("record" + string(i) + chr(ord("a") + j), "star", 0)
		]);
	}
}

if keyboard_check_direct(ord("1")) 
{
	setSpawnIndex(1);
	setGameFlag(Game_Flag.debugStart);
	room_goto(rm_inside2);
}
else if keyboard_check_direct(ord("2")) 
{
	setSpawnIndex(0);
	setGameFlag(Game_Flag.debugStart);
	room_goto(rm_outside2);
}
else {room_goto_next();}

ini_close(); // saveSettings()

if !file_exists("settings.ini") {saveSettings();}