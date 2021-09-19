/// @desc Converts color from rgb to bgr
/// @arg rgb_value
function bgr(argument0) {

	var _color = argument0;

	return (
		( (_color & 0xFF0000) >> 0x10 ) |	// Red -> Blue
		  (_color & 0x00FF00) |	// Green
		( (_color & 0x0000FF) << 0x10 )	// Blue -> Red
		);


}
