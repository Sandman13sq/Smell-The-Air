/// @desc 

if step == 0
{
	step = 60;
	COLOR = make_color_rgb(
		irandom_range(100, 255),
		irandom_range(100, 255),
		irandom_range(100, 255)
		);
}
else {step--;}