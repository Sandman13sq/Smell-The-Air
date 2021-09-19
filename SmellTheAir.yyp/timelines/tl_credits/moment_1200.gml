/// @desc Shade

creditsClear();

creditsSetAnimation(0, Animation_Index.shade_idle, -200, 219, 81, 219, 40);
creditsSet(1, spr_credits_shade1, 600, 82, 170, 82, 40);
creditsSet(3, spr_credits_shade0, -200, 129, 378, 129, 40);
creditsSet(4, "Shade", 600, 46, 378, 46, 40);

creditsSetAnimation(7, Animation_Index.shade_shootFake, 600, 219, 255, 219, 40);
with element[7] {COLOR = c_black;}