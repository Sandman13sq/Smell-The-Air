/// @desc 

depth = Layer_Depth.lightmap;

lightSurf = -1;
lightSurfPost = -1;
darkness = getGameFlag(Game_Flag.noWindows)? 0.5: 0.3;

bm0 = 4;
bm1 = 6;

lightRadiusDS = ds_list_create();
lightRadiusSize = 0;
collisionList = ds_list_create();

if isWindowClear()
{
	instance_destroy();
	return;
}

// lightArea_circle()