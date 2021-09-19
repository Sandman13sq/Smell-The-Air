/// @description  Returns color using position and array
/// @arg color_array,pos
/// merge_color_array(color_array,pos)
function merge_color_array(argument0, argument1) {

	var _arr = argument0, _pos = argument1;

	var _l = array_length_1d(_arr);

	if _l == 0 {return 0;}
	if _l == 1 {return _arr[0];}

	while (_pos >= _l) {_pos -= _l;}

	var _indexA = floor(_pos), _indexB = (_indexA + 1) mod _l;

	return merge_color(_arr[_indexA], _arr[_indexB], frac(_pos));



}
