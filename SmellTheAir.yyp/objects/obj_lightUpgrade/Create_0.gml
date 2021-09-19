/// @desc 

depth = Layer_Depth.player;

state = 0;
step = 0;
stepSpeed = 1;
hoverTime = 25;
hoverHeight = 16;
newColor = MAIN_OBJ.lightColor[1];

shineX = 0;
shineY = 0;

y_offset = 0;

with PLAYER
{
	setState(ST_player.null);
	other.x = x;
	other.y = y;
	other.sprite_index = sprite_index;
	other.image_xscale = image_xscale;
}

setupAnimation();
setAnimation(Animation_Index.light_idle);

enum ST_lightUpgrade {null, rise, hover, fall}