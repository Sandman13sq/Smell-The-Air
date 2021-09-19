/// @desc 

draw_sprite(spr_ight, 0, x + 80, y - 96);

var _color = COLOR;
if boolStep(flashStep, 4) {_color = flashColor;}

draw_sprite(spr_ightStand, 0, x, y);
draw_sprite_ext(spr_ightStand, 1, x, y, 1, 1, 0, _color, 1);

