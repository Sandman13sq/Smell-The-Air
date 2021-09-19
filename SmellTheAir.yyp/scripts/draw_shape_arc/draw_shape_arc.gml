/// @description  Draws arc
/// @arg x,y,rIn,rOut,angle_start,angle_end,color,alpha
/// draw_shape_arc(x,y,rIn,rOut,angle_start,angle_end,color,alpha)
function draw_shape_arc(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _x = argument0, _y = argument1,
	    _rIn = argument2, _rOut = argument3,
	    _thetaS = argument4, _thetaE = argument5,
	    _c = argument6, _a = argument7;

	if _thetaE < _thetaS
	{
	    var _temp = _thetaS;
	    _thetaS = _thetaE;
	    _thetaE = _temp;
	}

	var _precision = 16,
	    _angle = 0, _sep = 360 / _precision,
	    _angleNext = _sep;

	// Draw single triangle
	if (_thetaE - _thetaS) <= _sep
	{
	    draw_primitive_begin(pr_trianglelist);

	    draw_vertex_colour(
	        _x + lengthdir_x(_rIn, _thetaS), 
	        _y + lengthdir_y(_rIn, _thetaS), 
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rOut, _thetaS), 
	        _y + lengthdir_y(_rOut, _thetaS), 
	        _c, _a);
    
	    draw_vertex_colour(
	        _x + lengthdir_x(_rOut, _thetaE), 
	        _y + lengthdir_y(_rOut, _thetaE), 
	        _c, _a);
    
	    draw_primitive_end();
    
	    exit;
	}

	// Draw triangles to create circle    
	draw_primitive_begin(pr_trianglelist);

	while (_angle < _thetaE)
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
    
	    if (_angleNext + _sep < _thetaE) {_angleNext += _sep}
	    else {_angleNext = _thetaE;}
	}

	draw_primitive_end();





}
