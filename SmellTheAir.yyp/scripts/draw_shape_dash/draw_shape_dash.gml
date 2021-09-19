/// @description  Draws line with flat edges
/// @arg x1,y1,x2,y2,width,color,alpha
/// draw_shape_dash(x1,y1,x2,y2,width,color,alpha)
function draw_shape_dash(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x1 = argument0, _y1 = argument1,
	    _x2 = argument2, _y2 = argument3,
	    _w = argument4 * 0.5, _c = argument5, _a = argument6;

	var _angle = point_direction(_x1, _y1, _x2, _y2) + 90;

	draw_primitive_begin(pr_trianglelist);

	// Body
	draw_vertex_colour(
	    _x1 + lengthdir_x(_w, _angle),
	    _y1 + lengthdir_y(_w, _angle),
	    _c, _a
	    );

	draw_vertex_colour(
	    _x1 - lengthdir_x(_w, _angle),
	    _y1 - lengthdir_y(_w, _angle),
	    _c, _a
	    );

	draw_vertex_colour(
	    _x2 - lengthdir_x(_w, _angle),
	    _y2 - lengthdir_y(_w, _angle),
	    _c, _a
	    );

	// --

	draw_vertex_colour(
	    _x2 - lengthdir_x(_w, _angle),
	    _y2 - lengthdir_y(_w, _angle),
	    _c, _a
	    );

	draw_vertex_colour(
	    _x2 + lengthdir_x(_w, _angle),
	    _y2 + lengthdir_y(_w, _angle),
	    _c, _a
	    );

	draw_vertex_colour(
	    _x1 + lengthdir_x(_w, _angle),
	    _y1 + lengthdir_y(_w, _angle),
	    _c, _a
	    );

	draw_primitive_end();



}
