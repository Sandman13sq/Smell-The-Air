/// @desc 
if !active return;

draw_text(0, 0, "&");

var _l = ds_list_size(elementList), _el;

for (var _eIndex = 0; _eIndex < _l; _eIndex++)
{
	_el = elementList[| _eIndex];
	
	switch(_el[0])
	{
		case(1): // Line
			var _angle = point_direction(_el[1], _el[2], _el[3], _el[4]) + 90,
				_xoff = lengthdir_x(1, _angle) * 0.5,
				_yoff = lengthdir_y(1, _angle) * 0.5;
	
			// draw Line
			draw_primitive_begin(pr_trianglelist);
	
			draw_vertex_colour(_el[1] + _xoff, _el[2] + _yoff, c_lime, 1);
			draw_vertex_colour(_el[3] + _xoff, _el[4] + _yoff, c_lime, 1);
			draw_vertex_colour(_el[3] - _xoff, _el[4] - _yoff, c_lime, 1);
	
			draw_vertex_colour(_el[3] - _xoff, _el[4] - _yoff, c_lime, 1);
			draw_vertex_colour(_el[1] - _xoff, _el[2] - _yoff, c_lime, 1);
			draw_vertex_colour(_el[1] + _xoff, _el[2] + _yoff, c_lime, 1);
	
			draw_primitive_end();
			
			// Length & Pos
			draw_set_halign(1); draw_set_valign(2);
			draw_text(_el[1], _el[2], string(_el[1]) + "," + string(_el[2]));
			draw_text(_el[3], _el[4], string(_el[3]) + "," + string(_el[4]));
			
			draw_set_halign(1); draw_set_valign(0);
			draw_text(
				lerp(_el[1], _el[3], 0.5), lerp(_el[2], _el[4], 0.5), 
				point_distance(_el[1], _el[2], _el[3], _el[4]));
			break;
	}
}