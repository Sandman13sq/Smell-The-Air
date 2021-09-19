/// @desc 

if step < stepMax
{
	step++;
	
	var _amt = flip? 1 - (step / stepMax): (step / stepMax);
	
	x = lerp(x_start, x_dest, _amt);
	y = lerp(y_start, y_dest, _amt);
	
	sizeShow = intpl_para(size, 0, _amt);
}
else {instance_destroy();}