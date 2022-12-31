/// @desc Do input key press handling
// If the box was clicked, begin the check.
if (__inputEnabled) {
	if (keyboard_check(vk_anykey)) && (string_length(__text) < __charLimit) {
		__text += str(keyboard_string);
		keyboard_string = "";
	} else if (__charLimit < 1) {
		__text += str(keyboard_string);
		keyboard_string = "";
	}
	
	if (keyboard_check(vk_backspace)) && (!keyboard_check_pressed(vk_backspace)) && (__deleteTimer == 2) {
		__text = string_delete(__text, string_length(__text), 1);
		__deleteTimer = 0;
		keyboard_string = "";
	}
	
	if (keyboard_check_pressed(vk_backspace)) {
		__text = string_delete(__text, string_length(__text), 1);
		keyboard_string = "";
		__deleteTimer = -20;
	}
	
	if (__deleteTimer != 2) __deleteTimer++;
}

// Set image index.
image_index = __inputEnabled;
