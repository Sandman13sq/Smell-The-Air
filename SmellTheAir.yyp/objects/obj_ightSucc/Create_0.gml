/// @desc 

depth = Layer_Depth.BG + 10;

x_dest = obj_ightStand.ightX;
y_dest = obj_ightStand.ightY;

var _range = irandom_range(80, 160);

direction = irandom(360);

x_start = x_dest - lengthdir_x(_range, direction);
y_start = y_dest - lengthdir_y(_range, direction);

x = x_start;
y = y_start;

size = irandom_range(4, 8);
sizeShow = size;
step = 0;
stepMax = irandom_range(30, 40)

COLOR = obj_bk.cloudShow[irandom(obj_bk.cloudCount - 1)];

flip = 0;