/// @desc Draws rectangle onto screen
/// @arg x,y,w,h,color,alpha
function draw_shape_rect_wh(argument0, argument1, argument2, argument3, argument4, argument5) {

	draw_sprite_ext(spr_pixel, 0,
		argument0, argument1,
		argument2, argument3,
		0, argument4, argument5
		);


}
