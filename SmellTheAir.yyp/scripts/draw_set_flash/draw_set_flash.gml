/// @desc Sets draw flash
/// @arg color,amt
function draw_set_flash(argument0, argument1) {

	var _u = shader_get_uniform(shd_default, "u_flashColor");

	shader_set_color_a(_u, argument0, argument1);



}
