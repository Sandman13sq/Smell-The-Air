///
/// @arg index,lightColor
function setLightColor(argument0, argument1) {

	var i = argument0 * 4, _light = argument1;

	colorLight[i + 0] = color_get_red(_light) / 255;
	colorLight[i + 1] = color_get_green(_light) / 255;
	colorLight[i + 2] = color_get_blue(_light) / 255;
	colorLight[i + 3] = 1;

	if i == 0
	{
		LIGHTCOLOR = _light;
	}


}
