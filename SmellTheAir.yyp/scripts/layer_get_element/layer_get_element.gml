/// @desc Returns element in layer
/// @arg layer,element_index
function layer_get_element(argument0, argument1) {

	var _lyr = argument0, _index = argument1;

	return array_get(layer_get_all_elements(_lyr), _index);


}
