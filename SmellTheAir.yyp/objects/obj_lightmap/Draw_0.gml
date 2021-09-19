/// @desc 

if getGameFlag(Game_Flag.inside)
{
	lightSurf = surface_maintain(lightSurf, CAMERA_W, CAMERA_H);
	lightSurfPost = surface_maintain(lightSurfPost, CAMERA_W, CAMERA_H);

	// -------------------------------
	
	surface_set_target(lightSurf);

	draw_clear_alpha(0, 0);

	draw_tilemap(LIGHTMAP, -CAMERA_X, -CAMERA_Y);
	
	// Draw Radii
	var _arr;
	for (var i = 0; i < lightRadiusSize; i++)
	{
		_arr = lightRadiusDS[| i];
		
		draw_shape_circle(_arr[0], _arr[1], _arr[2], 0, 1);
	}

	surface_reset_target();

	// ---------------------------------------------

	surface_set_target(lightSurfPost);

	draw_clear_alpha(0, 0);

	shader_set(shd_flipAlpha);
	draw_surface(lightSurf, 0, 0);
	shader_set(shd_default);

	surface_reset_target();

	// ---------------------------------------------

	gpu_set_blendmode_ext(bm0, bm1);
	draw_surface_ext(lightSurfPost, CAMERA_X, CAMERA_Y, 1, 1, 0, c_white, darkness);
	gpu_set_blendmode(bm_normal);
}