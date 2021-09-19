/// @desc Rotates light Colors
function rotateLightColors() {

	for (var i = 2; i < 8; i++)
	{
		setLightColor(i, drawLightColor[loop(i + chargeStep, 2, colorCount)]);
	}


}
