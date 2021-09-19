/// @desc 

var _a = [1, 2, 3, 4, 5, 6, 7, 8];

x = CAMERA_X_CENTER;

bgm(mus_title);

select = array_create(4);
state = 0;

recordList = MAIN_OBJ.recordList;
recordSelect = 0;
recordCount = ds_list_size(recordList[recordSelect]);

choiceString = ["PLAY", "OPTIONS", "CONTROLS"];

sub200Color = bgr(0xABFF87);
sub130Color = bgr(0xFFD800);

starFlag = MAIN_OBJ.starFlag;
starMax = 0;
for (var i = 0; i < 8; i++) {if starFlag & (1 << i) {starMax = i + 1;};}

starLabel = [
	"All Windows",
	"No Windows",
	"Damageless",
	"Pacifist",
	""
];
starColor = [
	bgr(0xFFFF00), 
	bgr(0x7CBCA0), 
	bgr(0x7F1155), 
	bgr(0xFF003B), 
	bgr(0xF0FFFF)
];
starCount = 5;

alarm[0] = 1;

eraseSelect = 0;