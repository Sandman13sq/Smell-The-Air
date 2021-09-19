/// @desc Brightens area
/// @arg cellX,cellY,light
function lightArea_brighten(argument0, argument1, argument2) {

	var _cellX = argument0, _cellY = argument1, _light = argument2;

	var _prevLight = tilemap_get(LIGHTMAP, _cellX, _cellY),
		_newLight = approach(_prevLight, 1, _light);

	tilemap_set(LIGHTMAP, _newLight, _cellX, _cellY);


}
