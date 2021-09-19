/// 
function animationIsOver() {

	if animationStepMax == 0 {return 1;}

	if animationLength == 0 {return 1;}

	return (
		(animationStep + 1) == animationStepMax
		&& animationFrameIndex == animationLength - 1
		);


}
