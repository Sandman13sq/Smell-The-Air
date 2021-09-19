/// @desc 

state = 0;

mode = 0;

boxWidth = CAMERA_W - 80;
boxHeight = 192;

label = ["KEYBOARD", "GAMEPAD"];

inputSelect = 0;
inputCount = Input._size;
inputName = array_create(inputCount);
inputName[Input.left] = "Left";
inputName[Input.up] = "Up";
inputName[Input.right] = "Right";
inputName[Input.down] = "Down";
inputName[Input.jump] = "Jump";
inputName[Input.fire] = "Fire";
inputName[Input.menu] = "Menu";

inputArr = [MAIN_OBJ.inputKey, MAIN_OBJ.inputPad];

polling = 0;