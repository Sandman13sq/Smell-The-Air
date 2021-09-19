/// @desc Draws 4-sided Polygon
/// @arg x1,y1,x2,y2,x3,y3,x4,y4,color,alpha
function draw_shape_polygon4(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	var _x1 = argument0, _y1 = argument1,
		_x2 = argument2, _y2 = argument3,
		_x3 = argument4, _y3 = argument5,
		_x4 = argument6, _y4 = argument7,
		_c = argument8, _a = argument9;

	draw_primitive_begin(pr_trianglefan);

	draw_vertex_color(_x1, _y1, _c, _a);
	draw_vertex_color(_x2, _y2, _c, _a);
	draw_vertex_color(_x3, _y3, _c, _a);

	draw_vertex_color(_x3, _y3, _c, _a);
	draw_vertex_color(_x4, _y4, _c, _a);
	draw_vertex_color(_x1, _y1, _c, _a);

	draw_primitive_end();


}
