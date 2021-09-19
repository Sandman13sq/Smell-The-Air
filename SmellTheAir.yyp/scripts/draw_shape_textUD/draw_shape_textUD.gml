/// @description  Draws text with color range top to bottom
/// @arg x,y,text,top_color,bottom_color,alpha
/// draw_shape_textUD(x,y,text,top_color,bottom_color,alpha)
function draw_shape_textUD(argument0, argument1, argument2, argument3, argument4, argument5) {

	draw_text_color(argument0, argument1, string_hash_to_newline(argument2), 
	    argument3, argument3, argument4, argument4, argument5);



}
