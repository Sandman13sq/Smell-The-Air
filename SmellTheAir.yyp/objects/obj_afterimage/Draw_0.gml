/// @desc 

if flashColor != -1 
{
	draw_set_flash(flashColor, 1);
	draw_self();
	draw_set_flash(0, 0);
}
else
{
	draw_self();
}