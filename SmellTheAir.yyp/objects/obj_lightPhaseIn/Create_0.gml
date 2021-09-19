/// @desc 

depth = Layer_Depth.player;

state = 0;
step = 150;
phaseTime = 40;
phaseColor = c_white;

shineX = 0;
shineY = 0;

y_speed = 0;

clearGameFlag(Game_Flag.useInput);

with PLAYER
{
	setState(ST_player.null);
	other.x = x;
	other.y = y - UNIT_PX;
	other.phaseColor = drawLightColor[0];
	other.shineX = x + 10;
	other.shineY = y + 2;
}

setupAnimation();
setAnimation(Animation_Index.light_phaseIn);