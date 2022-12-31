/// @desc If the box is clicked
var __buttonActivated = (mouse_check_button_released(mb_left)) && (instance_position(mouse_x, mouse_y, self));

if (__buttonActivated) {
	__control = !__control;
	image_index = __control;
	
	if (__control) __onFunction(); else __offFunction();
}