/// @description  Draws donut
/// @arg x,y,rIn,rOut,color,alpha
/// draw_shape_donut(x,y,rIn,rOut,color,alpha)
function draw_shape_donut(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _x = argument0, _y = argument1,
	    _rIn = argument2, _rOut = argument3,
	    _c = argument4, _a = argument5;

	var _precision = 16,
	    _angle = 0, _sep = 360 / _precision,
	    _angleNext = _sep;
    
	draw_primitive_begin(pr_trianglelist);

	for (var i = 0; i < _precision; i++)
	{
	    draw_vertex_colour(
	        _x + lengthdir_x(_rIn, _angle), 
	        _y + lengthdir_y(_rIn, _angle), 
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rOut, _angle), 
	        _y + lengthdir_y(_rOut, _angle), 
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rOut, _angleNext), 
	        _y + lengthdir_y(_rOut, _angleNext), 
	        _c, _a);
    
	    // ---------------
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rOut, _angleNext), 
	        _y + lengthdir_y(_rOut, _angleNext), 
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rIn, _angleNext),
	        _y + lengthdir_y(_rIn, _angleNext),
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rIn, _angle), 
	        _y + lengthdir_y(_rIn, _angle), 
	        _c, _a);
    
	    _angle += _sep;
	    _angleNext += _sep;
	}

	draw_primitive_end();



}
