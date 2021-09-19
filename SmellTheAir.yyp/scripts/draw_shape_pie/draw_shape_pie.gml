/// @description  Draws pie
/// @arg x,y,r,angle_start,angle_end,color,alpha
/// draw_shape_pie(x,y,r,angle_start,angle_end,color,alpha)
function draw_shape_pie(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = argument0, _y = argument1,
	    _r = argument2,
	    _thetaS = argument3, _thetaE = argument4,
	    _c = argument5, _a = argument6;

	if _thetaE < _thetaS
	{
	    var _temp = _thetaS;
	    _thetaS = _thetaE;
	    _thetaE = _temp;
	}

	var _precision = 16,
	    _angle = _thetaS, _sep = 360 / _precision;

	// Draw single triangle
	if (_thetaE - _thetaS) <= _sep
	{
	    draw_primitive_begin(pr_trianglelist);

	    draw_vertex_colour(_x, _y, _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_r, _thetaS), 
	        _y + lengthdir_y(_r, _thetaS), 
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_r, _thetaE), 
	        _y + lengthdir_y(_r, _thetaE), 
	        _c, _a);
    
	    draw_primitive_end();
    
	    exit;
	}

	// Draw triangles to create circle    
	draw_primitive_begin(pr_trianglelist);

	while (_angle < _thetaE)
	{
	    draw_vertex_colour(_x, _y, _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_r, _angle), 
	        _y + lengthdir_y(_r, _angle), 
	        _c, _a);
    
	    if (_angle + _sep < _thetaE) {_angle += _sep}
	    else {_angle = _thetaE;}
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_r, _angle), 
	        _y + lengthdir_y(_r, _angle), 
	        _c, _a);
	}

	draw_primitive_end();



}
