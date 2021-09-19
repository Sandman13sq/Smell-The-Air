/// @desc Shader Set Color
/// @arg shader_uniform,color
function shader_set_color(argument0, argument1) {

	shader_set_uniform_f(argument0,
		color_get_red(argument1) / 255,
		color_get_red(argument1) / 255,
		color_get_red(argument1) / 255,
		);


}
