///
/// @arg index,targetColor
function setLightTarget(argument0, argument1) {

	var i = argument0 * 4, _target = argument1;

	colorTarget[i + 0] = color_get_red(_target) / 255;
	colorTarget[i + 1] = color_get_green(_target) / 255;
	colorTarget[i + 2] = color_get_blue(_target) / 255;
	colorTarget[i + 3] = 1;



}
