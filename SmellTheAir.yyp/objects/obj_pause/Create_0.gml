/// @desc 

depth = -10000;

x = CAMERA_W * 0.5;
y = CAMERA_H * 0.5 - 64;

setGameFlag(Game_Flag.pauseAction);

state = -1;
select = 0;

sfx(snd_menuBack);

pauseString = [
	"MASTER VOLUME",
	"MUSIC VOLUME",
	"SFX VOLUME",
	"SCREEN RESOLUTION",
	"RESTART",
	"EXIT GAME",
	"RETURN TO GAME",
	];

resString = ["FULL", 1, 2, 3, 4];
resCount = array_length_1d(resString);

selectString = "";
selectBool = 0;
cameraSize = MAIN_OBJ.cameraSize;
	
pauseStringCount = array_length_1d(pauseString);