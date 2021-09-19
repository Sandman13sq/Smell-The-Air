/// @desc Shader Set Color
/// @arg shader_uniform,color,alpha
function shader_set_color_a(argument0, argument1, argument2) {

	shader_set_uniform_f(argument0,
		color_get_red(argument1) / 255,
		color_get_green(argument1) / 255,
		color_get_blue(argument1) / 255,
		argument2
		);


}
