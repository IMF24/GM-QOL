/// @desc Main process function
// Local flow variables.
var __runFunction = false;
var __inButton = false;

// Check if the mouse is either in the sprite or collision mask, based on the input arguments.
switch (__spriteCheckType) {
	// If inside the sprite image itself.
	case sprite:	if (in_sprite()) __inButton = 1; else __inButton = 0;	break;
	
	// If inside the sprite's collision mask.
	case mask:		if (in_mask()) __inButton = 1; else __inButton = 0; 	break;
	
	// If neither is valid.
	default:		__inButton = false;										break;
}

// Hover cursor control.
switch (__cursorType) {
	// Using normal mouse cursors.
	case cr_normal: window_set_cursor(__cursorList[__inButton]) break;
	
	// Using sprite cursors.
	case cr_sprite: cursor_sprite = __cursorList[__inButton]; break;
	
	// If neither are valid.
	default:
		window_set_cursor(__cursorList[0]);
		cursor_sprite = __cursorList[1];
	break;
}

// Input type switch.
switch (__inputType) {
	// If mouse is held down.
	case check:		if (mouse_check_button(__okInput)) __runFunction = true;			break;
	
	// If mouse is pushed down on this frame.
	case pressed:	if (mouse_check_button_pressed(__okInput)) __runFunction = true;	break;
	
	// If mouse is let go of on this frame.
	case released:	if (mouse_check_button_released(__okInput)) __runFunction = true;	break;
	
	// If none of the above are valid.
	default:		__runFunction = false;												break;
}

// Image render type.
switch (__buttonType) {
	// Using multiple sprites.
	case sprite: if (__inButton) sprite_index = __over; else sprite_index = __up; break;
	
	// Using one sprite's frames.
	case frame: if (__inButton) image_index = __over; else image_index = __up; break;
}

// If inside the button, and the OK button has been pressed, run the declared function.
if (__inButton) && (__runFunction) {
	__inButton = !__inButton;
	window_set_cursor(__cursorList[__inButton]);
	__okFunction();
}

