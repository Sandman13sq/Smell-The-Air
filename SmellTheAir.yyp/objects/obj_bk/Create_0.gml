/// @desc 

depth = Layer_Depth.outside;

state = 0;

backgroundColor = bgr(0x668094);
backgroundColor2 = bgr(0x00001F);

// Closest to Background -> Closest to Screen
cloudCount = 3;
cloudColor = [bgr(0xB6EAB6), bgr(0xA8CEB8), bgr(0x9BC2AB)];
cloudColor2 = [bgr(0x3F4991), bgr(0x4955B2), bgr(0x7D7FED)];
cloudSpeed = [0.5, 1, 4];
cloudSurface = array_create(cloudCount, -1);

cloudStep = 0;

bkShow = backgroundColor;
cloudShow = array_duplicate(cloudColor);
mergeStep = 0;
mergeTime = 200;

y = CAMERA_H - sprite_height * 4;