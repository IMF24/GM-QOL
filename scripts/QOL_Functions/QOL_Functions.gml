// QUALITY OF LIFE FUNCTIONS SCRIPT BY IMF24, ET AL.
// VERSION 1.2

// For the latest version of the QOL Script, visit the website!
// https://sites.google.com/view/gm-qol

// If you need help, either check out the online user documentation or join the Discord server!
// https://sites.google.com/view/gm-qol
// https://sites.google.com/view/gm-qol-docs
// https://discord.gg/rQCYE57dyS

// This article contains information regarding new script format as of GM Version 2.3.0:
// https://help.yoyogames.com/hc/en-us/articles/360005277377

// =====================================================================================
// Math Functions
// =====================================================================================
#region Math Functions
// Condensed number function.
// Script Origin: Wrote by IMF24
/// @arg {any} val					The value to convert to a number.
/// @return {Real}					Returns the value converted to a number.
/// @desc	Takes the input value and converts it to a number. Does the same thing as real(), but has a shortened name,
///			and unlike real(), this function will always return a real number! No errors necessary!
function int(__val) {
	var __convertedString = string_digits(string(__val));
	if (__convertedString == "") return 0; else return real(__convertedString);
}

// Cube number function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The value to cube.
/// @return {Real}					Returns the input number cubed.
/// @desc	Returns the cube of the input number.
function cbe(__x) {
	// Take the cube of the input number.
	return power(__x, 3);
}

// Cube root function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The value to take the cube root of.
/// @return {Real}					Returns the cube root of the input number.
/// @desc	Takes the cube root of the input number.
function cbrt(__x) {
	// Take the cube root of the input number.
	return power(__x, (1 / 3));
}

// Any root function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The value to take the nth root of.
/// @arg {Real} root				The nth root.
/// @return {Real}					Returns the nth root of the input number.
/// @desc	Takes the nth root of the input number.
function root(__x, __root) {
	// Take the nth root of the input number.
	return power(__x, (1 / __root));
}
	
// Power function, condensed.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The value to raise to the power of x.
/// @arg {Real} exp					The number to raise x to the power of.
/// @return {Real}					Returns the input number, raised to the power of x.
/// @desc	Takes the input number and raises it to the power of x. This is a condensed version of power().
function pow(__x, __exp) { return power(__x, __exp); }
	
// Invert value function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The value to invert.
/// @return {Real}					Returns the number inverted.
/// @desc	This function will take a number and return its inverse. In other words, the value's sign will flip, turning a
///			postive value negative and a negative value positive.
function inv(__x) { return -__x; }

// Wave value function.
// Script Origin: Unknown Author
/// @arg {Real} from				Moving FROM this value.
/// @arg {Real} to					Moving TO this value.
/// @arg {Real} duration			The amount of time to wave this value.
/// @arg {Real} offset				Offset the wave by this amount.
/// @return {Real}					Returns the resulting sine wave value.
/// @desc	Moves a value in a sine wave pattern over a given duration, between two values.
function wave(__from, __to, __duration, __offset) {
	var __a4 = (__to - __from) * 0.5;
	return __from + __a4 + sin((((current_time * 0.001) + __duration * __offset) / __duration) * (pi * 2)) * __a4;
}

// Approach value function.
// Script Origin: Unknown Author
/// @arg {Real} value				The value to use for the approach process.
/// @arg {Real} end					The value to end the approach process at.
/// @arg {Real} amount				The interval to move towards the end result.
/// @return {Real}					Returns the current value.
/// @desc	Moves a value by a given amount towards a desired amount. Will not overshoot the resulting value, and it
///			will work in both positive and negative directions!
function approach(__value, __end, __amount) {
	// Moving in the positive direction.
	if (__value < __end) {
		
		__value += __amount;
		
		if (__value > __end) return __end;
	
	// Moving in the negative direction.
	} else {
		__value -= __amount;
		
		if (__value < __end) return __end;
	}
	
	// Return the resulting value.
	return __value;
}

// Random chance function.
// Script Origin: ZackBellGames, et al.
/// @arg {Real} x					The probability of success.
/// @return {Bool}					Returns true or false if a success is earned randomly.
/// @desc	In a random chance of x, returns true or false.
function chance(__x) { return __x > random(1); }

// Length function.
// Script Origin: Wrote by IMF24
/// @arg {Any} container			The container to return the length of.
/// @return {Real}					Returns the length of the input container.
/// @desc	Returns the length of a container. -1 is returned if an invalid container is given.
function len(__container) {
	if (is_array(__container)) return array_length(__container);

	var __type = asset_get_type(string(__container));
	
	if (__type == asset_sprite) return sprite_get_number(__container);
	
	if (__type == asset_sound) return audio_sound_length(__container);
	
	if (is_string(__container)) return string_length(__container);
}

// Odd number function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The number to check for if it is odd.
/// @return {Bool}					Returns true or false if the input value is odd.
/// @desc	Returns a true value if the input value is an odd number.
function odd(__x) { if (__x % 2 != 0) return true; else return false; }

// Even number function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					The number to check for if it is even.
/// @return {Bool}					Returns true or false if the input value is even.
/// @desc	Returns a true value if the input value is an even number.
function even(__x) { if (__x % 2 == 0) return true; else return false; }

// Middle number function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x1					The first number.
/// @arg {Real} x2					The second number.
/// @return {Real}					Returns the number halfway between the maximum and minimum provided.
/// @desc	Takes two values and returns the value halfway between them.
function mid(__x1, __x2) { return (__x1 + __x2) / 2; }

// Distance function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x1					First X position.
/// @arg {Real} y1					First Y position.
/// @arg {Real} x2					Second X position.
/// @arg {Real} y2					Second Y position.
/// @return {Real}					Returns the distance between the two given points.
/// @desc	Uses the geometric distance formula to determine the distance between two points on the room or GUI layer graph.
///			The geometric distance formula is: D = √((x2 - x1)^2 + (y2 - y1)^2).
///
///			The answer is rounded to 2 decimal places, so 100% accuracy is not guaranteed with this function!
function distance(__x1, __y1, __x2, __y2) { return sqrt(sqr(__x2 - __x1) + sqr(__y2 - __y1)); }

// Midpoint function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x1					First X position.
/// @arg {Real} y1					First Y position.
/// @arg {Real} x2					Second X position.
/// @arg {Real} y2					Second Y position.
/// @return {Array<Real>}			Returns the midpoint between the two given points.
/// @desc	Uses the geometric midpoint formula to determine the midpoint between two points on the room or GUI layer graph.
///			The geometric midpoint formula is: M.P. = (((x1 + x2) / 2), ((y1 + y2) / 2))
///
///			The answers are rounded to 2 decimal places, so 100% accuracy is not guaranteed with this function!
function midpoint(__x1, __y1, __x2, __y2) {
	var __mx, __my;
	
	__mx = (__x1 + __x2) / 2;
	__my = (__y1 + __y2) / 2;
	
	return [__mx, __my];
}

// Array mean function.
// Script Origin: Wrote by IMF24
/// @arg {Array<Real>} array		An array of real numbers that the mean can be taken of.
/// @return {Real}					Returns the average of all numbers in the array.
/// @desc	Takes the mean (average) of an array of real numbers and returns it.
function array_mean(__array) {
	var __arrayValue = 0;
	var __arrayLength = array_length(__array);
	for (var i = 0; i < __arrayLength; i++) {
		__arrayValue += __array[i];
	}
	return __arrayValue / __arrayLength;
}

// Array median function.
// Script Origin: Wrote by IMF24
/// @arg {Array<Real>} array		An array of real numbers that the median can be taken of.
/// @return {Real}					Returns the median of all numbers in the array.
/// @desc	Takes the median of an array of real numbers and returns it.
function array_median(__array) {
	var __arrayLength = array_length(__array);
	var __medianPosition, __result;
	
	array_sort(__array, true);
	
	if (odd(__arrayLength)) {
		
		__medianPosition = floor(__arrayLength / 2);
		
		__result = __array[__medianPosition];
		
	} else {
		
		var __pos1, __pos2;
		__pos2 = __arrayLength / 2;
		__pos1 = __pos2 - 1;
		
		var __medianValues = [__array[__pos1], __array[__pos2]];
		__result = array_mean(__medianValues);
	}
	
	return __result;
}

// Array minimum value function.
// Script Origin: Wrote by IMF24
/// @arg {Array<Real>} array		An array of real numbers that the minimum can be taken of.
/// @return {Real}					Returns the smallest of all numbers in the array.
/// @desc	Returns the smallest number in the given array.
function array_min(__array) {
	var __min;
	for (var i = 0; i < len(__array); i++) {
		if (i == 0) __min = __array[i]; else {
			if (__array[i] < __min) __min = __array[i];
		}
	}
	
	return __min;
}

// Array maximum value function.
// Script Origin: Wrote by IMF24
/// @arg {Array<Real>} array		An array of real numbers that the maximum can be taken of.
/// @return {Real}					Returns the largest of all numbers in the array.
/// @desc	Returns the largest number in the given array.
function array_max(__array) {
	var __max;
	for (var i = 0; i < len(__array); i++) {
		if (i == 0) __max = __array[i]; else {
			if (__array[i] > __max) __max = __array[i];
		}
	}
	
	return __max;
}

#endregion

// =====================================================================================
// Text Functions
// =====================================================================================
#region Text Functions
// Condensed string function.
// Script Origin: Wrote by IMF24
/// @arg {any} val					The value to convert to a string.
/// @return {String}				Returns the value converted to a string.
/// @desc	Takes the input value and converts it to a string. Does the same thing as string(), but has a shortened name.
function str(__val) { return string(__val); }



// Print text function.
// Script Origin: Wrote by IMF24
/// @arg {any} value1
/// @arg {any} value2
/// @arg {any} value3
/// @return {Undefined}				Doesn't return anything.
/// @desc	Prints a message to the Output window. Unlike show_debug_message(), this function automatically converts all input values to strings.
function print() {
	var __valuesString = "";
	for (var i = 0; i < argument_count; i++) __valuesString += string(argument[i]) + " ";
	show_debug_message(__valuesString);
}

// Separated text function.
// Script Origin: Dmi7ry (https://forum.yoyogames.com/index.php?threads/solved-adding-commas-into-score.39152/)
/// @arg {Real} value				The value to draw with separators. No need to call string() in this argument, as it is done automatically.
/// @arg {String} separator			Text separator that will be inserted between x digits.
/// @arg {Real} digits				In between how many digits do you want to split the text?
/// @return {String}				Returns a string with the text separated between the specified number of digits.
/// @desc	Draws text with separators at the specified interval of characters in the string. You specify the value you 
///			want to split with separators, and then, if desired, you can specify what string of text to split the string
///			with and how many characters apart each split is.
///			
///			An example of use with this function could be if you want to draw numbers in the thousands with commas.
function text_draw_separated(__value, __separator = ",", __digits = 3) {
	// These get the values from the arguments.
	// Variable meanings:
	// val = Input value.
	// sep = Input separator.
	// dgt = Number of digits between each separation.
	// res = Resulting string.
	var __val = string(__value);
	var __sep = __separator;
	var __dgt = __digits - 1;
	var __res = "";

	// Add the separators into the number value.
	var __cnt = 0;
	for (var i = string_length(__val); i > 0; i--) {
	    __res = string_char_at(__val, i) + __res;
	    if (__cnt++ == __dgt) && (i > 1) {
	        __cnt = 0;
	        __res = __sep + __res;
	    }
	}
	
	// Then, at the very end, return the string with all desired separators in it.
	return __res;
}

// Concatenate text strings function.
// Script Origin: Shaun Spalding, et al. (https://youtu.be/5JZAAbyUNsQ?t=269)
/// @arg {String} str1
/// @arg {String} str2
/// @arg {String} str3
/// @return {String}				Returns the final concatenated string.
/// @desc	Takes the input strings and combines them all into one string.
function concat() {
	var __string = "";
	for (var i = 0; i < argument_count; i++) __string += string(argument[i]);
	return __string;
}

// Show a debug message with concatenated strings.
// Script Origin: Shaun Spalding, et al. (https://youtu.be/5JZAAbyUNsQ?t=269)
/// @arg {String} str1
/// @arg {String} str2
/// @arg {String} str3
/// @return {Undefined}				Doesn't return anything.
/// @desc	Takes the input strings, combines them all into one string, then prints them as a debug message in the Output window.
function show_concat_debug_message() {
	var __string = "";
	for (var i = 0; i < argument_count; i++) __string += string(argument[i]);
	show_debug_message(__string);
}

// Make string from variables function.
// Script Origin: Gurpreet Singh Matharoo
/// @arg {String} str1
/// @arg {String} str2
/// @arg {String} str3
/// @return {String}				Returns the string that holds the value of the defined variables.
/// @desc	Takes a list of variables and displays their current values. Make sure you pass these variables in as strings!
function make_string_from_vars() {
	var __string = "";
	for (var i = 0; i < argument_count; i++) __string += argument[i] + ": " + string(self[$ argument[i]]) + "\n";
	return __string;
}

#endregion

// =====================================================================================
// Image & Sprite Functions
// =====================================================================================
#region Image & Sprite Functions
// Image scale function.
// Script Origin: Wrote by IMF24
/// @arg {Real} xscale						The X value to scale the image of this object by horizontally.
/// @arg {Real} yscale						The Y value to scale the image of this object by vertically.
/// @arg {Asset.GMObject} object			Object to change the image scale of.
/// @return {Array<Real>}					Returns an array of the new image scale of the object.
/// @desc	Image scale function that allows you to directly control the image scale of an object without having to
///			use the variables image_xscale and image_yscale. Declare which object that you want to scale the
///			sprite of and then input the amount you want to scale that instance's sprite by in X and Y.
function image_scale(__xscale, __yscale, __object = self) {
	var __objExists = instance_exists(__object);
	if (__objExists) {
		with (__object) {
			image_xscale = __xscale;
			image_yscale = __yscale;
		}	
		return [__object.image_xscale, __object.image_yscale];
		
	} else return [-1, -1];
}

// Animation end function.
// Script Origin: Pixelated Pope and Minty Python, GameMaker Subreddit Discord Server, Modified by IMF24
/// @arg {Asset.GMSprite} sprite_index		The index of the sprite currently animating.
/// @arg {Real} image_index					The current frame.
/// @arg {Real} rate						Rate of change (in frames per step) if not using built-in image_index/speed.
/// @desc	This function will return a true or false value if an object's sprite's animation will end on this frame.
function animation_end(__sprite = sprite_index, __image = image_index, __speed = (sprite_get_speed(sprite_index) * image_speed)) {
	var __type = sprite_get_speed_type(__sprite);
	var __spd = sprite_get_speed(__sprite) * image_speed;
	
	if (__type == spritespeed_framespersecond) __spd /= game_fps;
	
	return __image + __spd >= sprite_get_number(__sprite);
}

// Origin point retrieval function.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} sprite			The sprite to get the origin point of.
/// @return {Array<Real>}					Returns an array containing the origin point of a sprite.
/// @desc	This function will get the origin point of a sprite.
function sprite_get_origin(__sprite) {
	if (sprite_exists(__sprite)) return [sprite_get_xoffset(__sprite), sprite_get_yoffset(__sprite)]; else return [-1, -1];
}

// Inside of sprite function.
// Script Origin: Wrote by IMF24
/// @return {Bool}							Returns true if the mouse is inside of the sprite.
/// @desc	This function can be used to determine if the mouse is within a sprite.
function in_sprite() {
	if (point_in_rectangle(
		mouse_x, mouse_y,
		x - sprite_xoffset,
		y - sprite_yoffset,
		x + sprite_width - sprite_xoffset,
		y + sprite_height - sprite_yoffset
	)) return true; else return false;
}

// Inside of mask function.
// Script Origin: Wrote by IMF24
/// @return {Bool}							Returns true if the mouse is inside of the sprite's collision mask.
/// @desc	This function can be used to determine if the mouse is within a sprite's collision mask.
function in_mask() {
	if (point_in_rectangle(
		mouse_x, mouse_y,
		bbox_left,
		bbox_top,
		bbox_right,
		bbox_bottom
	)) return true; else return false;
}

#endregion

// =====================================================================================
// Object Functions
// =====================================================================================
#region Object Functions
// Move function with keyboard, used for basic movement.
// Script Origin: Wrote by IMF24
/// @arg {Real} interval			The distance to move when the given inputs are pressed.
/// @arg {Array<any>} left*			The input(s) to use for moving left.
/// @arg {Array<any>} right*		The input(s) to use for moving right.
/// @arg {Array<any>} up*			The input(s) to use for moving up.
/// @arg {Array<any>} down*			The input(s) to use for moving down.
/// @return {Undefined}				Doesn't return anything.
/// @desc	Allows for definition of a basic movement system on a 2D plane by a given interval for the keyboard. In each
///			directional argument, input an array listing all usable inputs for that direction.
function move_define_keyboard(__interval, __left = [vk_left, ord("A")], __right = [vk_right, ord("D")], __up = [vk_up, ord("W")], __down = [vk_down, ord("S")]) {
	for (var i = 0; i < array_length(__left); i++) {
		if (keyboard_check(__left[i])) x -= __interval;
	}
	
	for (var i = 0; i < array_length(__right); i++) {
		if (keyboard_check(__right[i])) x += __interval;
	}
	
	for (var i = 0; i < array_length(__up); i++) {
		if (keyboard_check(__up[i])) y -= __interval;
	}
	
	for (var i = 0; i < array_length(__down); i++) {
		if (keyboard_check(__down[i])) y += __interval;
	}
}

// Jump in direction function.
// Script Origin: Shaun Spalding (https://www.youtube.com/watch?v=2FroAhEsuE8), Modified by IMF24
/// @arg {Real} distance			The distance to move.
/// @arg {Real} direction			The direction to move in.
/// @arg {Asset.GMObject} object*	The object to perform the move on.
/// @return {Undefined}				Doesn't return anything.
/// @desc	Moves the object to a location based on a given direction and distance.
function jump_in_direction(__length, __direction, __object = self) {
	var __objectExists = instance_exists(__object);
	if (__objectExists) {
		x += lengthdir_x(__length, __direction);
		y += lengthdir_y(__length, __direction);
	}
}

// Timer event function.
// Script Origin: Wrote by IMF24
/// @arg {Real} mins				Amount of minutes to set this timer to.
/// @arg {Real} secs				Amount of seconds to set this timer to.
/// @arg {Real} x					The X position to show the timer at.
/// @arg {Real} y					The Y position to show the timer at.
/// @arg {Function} event			The event to perform when the timer reaches 0:00.
/// @arg {Bool} loop				Do you want this event to loop when the timer has ended?
/// @return {Id.Instance}			Returns the ID of the timer instance created.
/// @desc	Makes a new timer on the screen. An event to be run can be defined as a function in the event argument,
///			and you can have the event loop if you wish.
function timer_create(__min, __sec, __x, __y, __ev, __loop) {
	// Make new timer instance.
	var __timerInst = instance_create_depth(0, 0, 0, __qolTimer);
	
	// Set its properties.
	with (__timerInst) {
		__mins = __min;
		__secs = __sec;
		__drawX = __x;
		__drawY = __y;
		__event = __ev;
		__loopEvent = __loop;
	}
	
	// Return nothing.
	return __timerInst;
}

// Timer event function, but with more options.
// Script Origin: Wrote by IMF24
/// @arg {Real} mins				Amount of minutes to set this timer to.
/// @arg {Real} secs				Amount of seconds to set this timer to.
/// @arg {Real} x					The X position to show the timer at.
/// @arg {Real} y					The Y position to show the timer at.
/// @arg {Function} event			The event to perform when the timer reaches 0:00.
/// @arg {Bool} loop				Do you want this event to loop when the timer has ended?
/// @arg {Real} alpha				Alpha opacity the timer should draw with.
/// @arg {Constant.Color} color		The color the timer should be drawn in.
/// @arg {Asset.GMFont} font		Font to draw the timer in.
/// @arg {Constant.HAlign} halign	The horizontal alignment of the timer.
/// @arg {Constant.VAlign} valign	The vertical alignment of the timer.
/// @arg {Real} mode				The draw mode for the timer. 0: Normal draw, 1: GUI draw
/// @return {Id.Instance}			Returns the ID of the timer instance created.
/// @desc	Makes a new timer on the screen. An event to be run can be defined as a function in the event argument,
///			and you can have the event loop if you wish, and this version allows for more customization.
function timer_create_ext(__min, __sec, __x, __y, __ev, __loop, __alpha, __color, __font, __halign, __valign, __mode) {
	// Make new timer instance.
	var __timerInst = instance_create_depth(0, 0, 0, __qolTimer);
	
	// Set its properties.
	with (__timerInst) {
		__mins = __min;
		__secs = __sec;
		__drawX = __x;
		__drawY = __y;
		__event = __ev;
		__loopEvent = __loop;
		__drawAlpha = __alpha;
		__drawColor = __color;
		__drawFont = __font;
		__drawHAlign = __halign;
		__drawVAlign = __valign;
		__drawMode = __mode;
	}
	
	// Return nothing.
	return __timerInst;
}

// Button object function, uses a single sprite and its frames.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} sprite			The sprite to use for the button object.
/// @arg {Real}	up							The frame of the sprite to display when the button is not highlighted.
/// @arg {Real} over						The frame of the sprite to display when the button is highlighted.
/// @arg {Constant.MouseButton} button		Mouse button that the function will check for.
/// @arg {Function} okFunction				The function that will be executed upon selection of the button.
/// @arg {Real} x							The X position of the button.
/// @arg {Real} y							The Y position of the button.
/// @arg {Real} depth						The depth to draw the button at. Layers are not supported.
/// @return {Id.Instance}					Returns the ID of the button instance created.
/// @desc	Makes a button instance on the screen, using a single sprite and its frames to show the button. You specify
///			the indexes used for the hover and inactive hover on the button, and you define the function to be executed
///			when selected. The button created assumes the mouse is the input peripheral.
///
///			This function returns the ID of the button that was created.
function button_create_frame(__sprite, __upFrame, __overFrame, __buttonInput, __okFunc, __x, __y, __depth) {
	// Make new button instance.
	var __buttonInst = instance_create_depth(__x, __y, __depth, __qolButton);
	
	// Change the button's properties.
	with (__buttonInst) {
		__buttonType = frame;
		
		sprite_index = __sprite;
		__up = __upFrame;
		__over = __overFrame;
		__okFunction = __okFunc;
		
		x = __x;
		y = __y;
		depth = __depth;
	}
	
	// Returns the ID of the created button.
	return __buttonInst;
}

// Button object function, uses a single sprite and its frames, with more customization options.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} sprite			The sprite to use for the button object.
/// @arg {Real}	up							The frame of the sprite to display when the button is not highlighted.
/// @arg {Real} over						The frame of the sprite to display when the button is highlighted.
/// @arg {Constant.MouseButton} button		Mouse button that the function will check for.
/// @arg {Function} okFunction				The function that will be executed upon selection of the button.
/// @arg {Real} x							The X position of the button.
/// @arg {Real} y							The Y position of the button.
/// @arg {Real} depth						The depth to draw the button at. Layers are not supported.
/// @arg {Real} inputCheckType				The type of function check to use when checking if the button is pressed. Use 0 for check, 1 for pressed, and 2 for released.
/// @arg {Real} spriteCheckType				Type of check to perform on the sprite, either checking within its sprite (0) or its collision mask (1).
/// @arg {Real} cursorType					The cursor type to use. 0 is for normal system cursors, 1 is for cursor sprites.
/// @arg {Array<Any>} cursors				Array housing all possible cursors. These can either be mouse cursors (cr_*) or sprites. Must hold 2 entries, first is for up, second is for over.
/// @arg {Real} alpha						Alpha opacity for the button.
/// @arg {Constant.Color} blend				Color to use for blending the button sprite. Set to c_white or -1 for no blend.
/// @arg {Real} angle						Interval of rotation for the button, ranges from 0 to 360.
/// @arg {Array<Real>} scale				Array with the X and Y scaling. X comes first, then the Y scale.
/// @return {Id.Instance}					Returns the ID of the button instance created.
/// @desc	Makes a button instance on the screen, using a single sprite and its frames to show the button with more
///			customization. You specify the indexes used for the hover and inactive hover on the button, and you define
///			the function to be executed when selected. The button created assumes the mouse is the input peripheral.
///			
///			This function returns the ID of the button that was created.
function button_create_frame_ext(__sprite, __upFrame, __overFrame, __buttonInput, __okFunc, __x, __y, __depth, __inputCheckType, __spriteCheck, __cursorTypes, __cursors, __alpha, __blend, __angle, __scaleArray) {
	// Make new button instance.
	var __buttonInst = instance_create_depth(__x, __y, __depth, __qolButton);
	
	// Change the button's properties.
	with (__buttonInst) {
		__buttonType = frame;
		
		sprite_index = __sprite;
		__up = __upFrame;
		__over = __overFrame;
		__okFunction = __okFunc;
		
		__inputType = __inputCheckType;
		__spriteCheckType = __spriteCheck;
		
		__cursorType = __cursorTypes;
		__cursorList = __cursors;
		
		image_alpha = __alpha;
		image_angle = __angle;
		image_blend = __blend;
		
		image_xscale = __scaleArray[0];
		image_yscale = __scaleArray[1];
		
		x = __x;
		y = __y;
		depth = __depth;
	}
	
	// Returns the ID of the created button.
	return __buttonInst;
}

// Button object function, uses multiple sprites.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} up				The sprite to display when the button is not highlighted.
/// @arg {Asset.GMSprite} over				The sprite to display when the button is highlighted.
/// @arg {Constant.MouseButton} button		Mouse button that the function will check for.
/// @arg {Function} okFunction				The function that will be executed upon selection of the button.
/// @arg {Real} x							The X position of the button.
/// @arg {Real} y							The Y position of the button.
/// @arg {Real} depth						The depth to draw the button at. Layers are not supported.
/// @return {Id.Instance}					Returns the ID of the button instance created.
/// @desc	Makes a button instance on the screen, using multiple different sprites to show the button. You specify the
///			indexes used for the hover and inactive hover on the button, and you define the function to be executed
///			when selected. The button created assumes the mouse is the input peripheral.
///
///			This function returns the ID of the button that was created.
function button_create_sprite(__upSprite, __overSprite, __buttonInput, __okFunc, __x, __y, __depth) {
	// Make new button instance.
	var __buttonInst = instance_create_depth(__x, __y, __depth, __qolButton);
	
	// Change the button's properties.
	with (__buttonInst) {
		__buttonType = sprite;

		__up = __upSprite;
		__over = __overSprite;
		__okFunction = __okFunc;
		
		x = __x;
		y = __y;
		depth = __depth;
	}
	
	// Returns the ID of the created button.
	return __buttonInst;
}

// Button object function, uses multiple sprites, with more customization options.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} up				The sprite to display when the button is not highlighted.
/// @arg {Asset.GMSprite} over				The sprite to display when the button is highlighted.
/// @arg {Constant.MouseButton} button		Mouse button that the function will check for.
/// @arg {Function} okFunction				The function that will be executed upon selection of the button.
/// @arg {Real} x							The X position of the button.
/// @arg {Real} y							The Y position of the button.
/// @arg {Real} depth						The depth to draw the button at. Layers are not supported.
/// @arg {Real} inputCheckType				The type of function check to use when checking if the button is pressed. Use 0 for check, 1 for pressed, and 2 for released.
/// @arg {Real} spriteCheckType				Type of check to perform on the sprite, either checking within its sprite (0) or its collision mask (1).
/// @arg {Real} cursorType					The cursor type to use. 0 is for normal system cursors, 1 is for cursor sprites.
/// @arg {Array<Any>} cursors				Array housing all possible cursors. These can either be mouse cursors (cr_*) or sprites. Must hold 2 entries, first is for up, second is for over.
/// @arg {Real} alpha						Alpha opacity for the button.
/// @arg {Constant.Color} blend				Color to use for blending the button sprite. Set to c_white or -1 for no blend.
/// @arg {Real} angle						Interval of rotation for the button, ranges from 0 to 360.
/// @arg {Array<Real>} scale				Array with the X and Y scaling. X comes first, then the Y scale.
/// @return {Id.Instance}					Returns the ID of the button instance created.
/// @desc	Makes a button instance on the screen, using multiple different sprites to show the button, with more
///			customization. You specify the indexes used for the hover and inactive hover on the button, and you define
///			the function to be executed when selected. The button created assumes the mouse is the input peripheral.
///
///			This function returns the ID of the button that was created.
function button_create_sprite_ext(__upSprite, __overSprite, __buttonInput, __okFunc, __x, __y, __depth, __inputCheckType, __spriteCheck, __cursorTypes, __cursors, __alpha, __blend, __angle, __scaleArray) {
	// Make new button instance.
	var __buttonInst = instance_create_depth(__x, __y, __depth, __qolButton);
	
	// Change the button's properties.
	with (__buttonInst) {
		__buttonType = sprite;
		
		__up = __upSprite;
		__over = __overSprite;
		__okFunction = __okFunc;
		
		__inputType = __inputCheckType;
		__spriteCheckType = __spriteCheck;
		
		__cursorType = __cursorTypes;
		__cursorList = __cursors;
		
		image_alpha = __alpha;
		image_angle = __angle;
		image_blend = __blend;
		
		image_xscale = __scaleArray[0];
		image_yscale = __scaleArray[1];
		
		x = __x;
		y = __y;
		depth = __depth;
	}
	
	// Returns the ID of the created button.
	return __buttonInst;
}

// Button text function.
// Script Origin: Wrote by IMF24
/// @arg {Id.Instance} button				The instance ID of the button to put text on.
/// @arg {String} text						The text to draw to the button.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Adds a string of text to a button. This needs to have a button that has previously been created to draw the
///			text to. For best results, use this right after calling button_create_*().
function button_text(__button, __text) {
	if (!instance_exists(__button)) exit;
	
	with (__button) {
		__buttonText = __text;
	}
	
	return undefined;
}

// Button text function with more options.
// Script Origin: Wrote by IMF24
/// @arg {Id.Instance} button				The instance ID of the button to put text on.
/// @arg {String} text						The text to draw to the button.
/// @arg {Real} alpha						The alpha of the text.
/// @arg {Constant.Color} color				The color of the text.
/// @arg {Asset.GMFont} font				The font to use for the text.
/// @arg {Constant.HAlign} halign			Horizontal alignment for the text.
/// @arg {Constant.VAlign} valign			Vertical alignment for the text.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Adds a string of text to a button, but with more customization options. This needs to have a button that has
///			previously been created to draw the text to, For best results, use this right after calling button_create_*().
function button_text_ext(__button, __text, __alpha, __color, __font, __halign, __valign) {
	if (!instance_exists(__button)) exit;
	
	with (__button) {
		__buttonText = __text;
		__textAlpha = __alpha;
		__textColor = __color;
		__textFont = __font;
		__textHAlign = __halign;
		__textVAlign = __valign;
	}
	
	return undefined;
}

// Input text box function.
// Script Origin: Original Code by Seb Havens, Wrote by IMF24
/// @arg {Real} x			X position to create the text box at.
/// @arg {Real} y			Y position to create the text box at.
/// @arg {Real} depth		Depth to create the text box at. Layers are not supported.
/// @arg {Real} xscale		Length of the text box.
/// @arg {Real} yscale		Height of the text box.
/// @return {Id.Instance}	Returns the ID of the created text box instance.
/// @desc	This function will create a basic text box onto the screen, allowing you to type in it up to a maximum of 32
///			characters. You can also specify how long and tall you want the box to be too!
function text_box_create(__x, __y, __depth, __xscale, __yscale) {
	var __inputInst = instance_create_depth(__x, __y, __depth, __qolInput);
	
	with (__inputInst) {
		image_xscale = __xscale;
		image_yscale = __yscale;
	}
	
	return __inputInst;
}

// Input text box function with more options.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the text box at.
/// @arg {Real} y					Y position to create the text box at.
/// @arg {Real} depth				Depth to create the text box at. Layers are not supported.
/// @arg {Real} xscale				Length of the text box.
/// @arg {Real} yscale				Height of the text box.
/// @arg {String} hint				The hint text to display in the text box if no text is entered.
/// @arg {Real} limit				The character limit for a text box.
/// @arg {Real} alpha				Alpha opacity of the text.
/// @arg {Constant.Color} color		Color of the text.
/// @arg {Asset.GMFont} font		Font to be used for the text.
/// @arg {Constant.HAlign} halign	Horizontal alignment of the text.
/// @arg {Constant.VAlign} valign	Vertical alignment of the text.
/// @arg {Asset.GMSprite} sprite	Sprite to use for the text box, if desired. The sprite should have at least 2 frames: 1st for deselected, 2nd for selected.
/// @return {Id.Instance}			Returns the ID of the created text box instance.
/// @desc	This function will create a text box onto the screen, allowing you to specify the character limit, text
///			properties, hint text, and many more things!
function text_box_create_ext(__x, __y, __depth, __xscale, __yscale, __hint, __limit, __alpha, __color, __font, __halign, __valign, __sprite = __qolInputBox) {
	var __inputInst = instance_create_depth(__x, __y, __depth, __qolInput);
	
	with (__inputInst) {
		image_xscale = __xscale;
		image_yscale = __yscale;
		
		__hintText = __hint;
		__charLimit = __limit;
		
		__textAlpha = __alpha;
		__textColor = __color;
		__textFont = __font;
		__textHAlign = __halign;
		__textVAlign = __valign;
		
		sprite_index = __sprite;
	}
	
	return __inputInst;
}

// Check box creation function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the check box at.
/// @arg {Real} y					Y position to create the check box at.
/// @arg {Real} depth				Depth to create the check box at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the check box is ON.
/// @arg {Function} offFunction		The function to be performed when the check box is OFF.
/// @return {Id.Instance}			Returns the ID of the created check box instance.
/// @desc	This function will create a check box that will perform various functions when turned on or off.
function check_box_create(__x, __y, __depth, __onFunc, __offFunc) {
	var __checkBoxInst = instance_create_depth(__x, __y, __depth, __qolCheckBox);
	
	with (__checkBoxInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
	}
	
	return __checkBoxInst;
}

// Check box creation function with more options.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the check box at.
/// @arg {Real} y					Y position to create the check box at.
/// @arg {Real} depth				Depth to create the check box at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the check box is ON.
/// @arg {Function} offFunction		The function to be performed when the check box is OFF.
/// @arg {Real} xscale				Horizontal scaling of the check box.
/// @arg {Real} yscale				Vertical scaling of the check box.
/// @arg {Real} alpha				Alpha opacity of the check box.
/// @arg {Constant.Color} blend		The color blend of the check box. Set to c_white or -1 for no blend.
/// @arg {Real} angle				Rotation of the check box, ranging from 0 to 360.
/// @arg {Asset.GMSprite} sprite	The sprite to use for the box, if desired. The sprite should have at least 2 frames: 1st for deselected, 2nd for selected.
/// @return {Id.Instance}			Returns the ID of the created check box
/// @desc	This function will create a check box that will perform various functions when turned on or off, but has more
///			customization options. The sprite can be changed and it can be resized and blended.
function check_box_create_ext(__x, __y, __depth, __onFunc, __offFunc, __xscale, __yscale, __alpha, __blend, __angle, __sprite = __qolCheckBoxSpr) {
	var __checkBoxInst = instance_create_depth(__x, __y, __depth, __qolCheckBox);
	
	with (__checkBoxInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
		
		image_xscale = __xscale;
		image_yscale = __yscale;
		
		image_alpha = __alpha;
		image_blend = __blend;
		image_angle = __angle;
		
		sprite_index = __sprite;
	}
	
	return __checkBoxInst;
}
	
// Radio check box creation function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the check box at.
/// @arg {Real} y					Y position to create the check box at.
/// @arg {Real} depth				Depth to create the check box at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the check box is ON.
/// @arg {Function} offFunction		The function to be performed when the check box is OFF.
/// @return {Id.Instance}			Returns the ID of the created check box instance.
/// @desc	This function will create a radio check box that will perform various functions when turned on or off. Unlike
///			the normal check box, boxes created with this function can only have one box selected at a time.
function check_box_radio_create(__x, __y, __depth, __onFunc, __offFunc) {
	var __radioCheckBoxInst = instance_create_depth(__x, __y, __depth, __qolCheckBoxRadio);
	
	with (__radioCheckBoxInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
	}
	
	return __radioCheckBoxInst;
}	

// Radio check box creation function with more options.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the check box at.
/// @arg {Real} y					Y position to create the check box at.
/// @arg {Real} depth				Depth to create the check box at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the check box is ON.
/// @arg {Function} offFunction		The function to be performed when the check box is OFF.
/// @arg {Real} xscale				Horizontal scaling of the check box.
/// @arg {Real} yscale				Vertical scaling of the check box.
/// @arg {Real} alpha				Alpha opacity of the check box.
/// @arg {Constant.Color} blend		The color blend of the check box. Set to c_white or -1 for no blend.
/// @arg {Real} angle				Rotation of the check box, ranging from 0 to 360.
/// @arg {Asset.GMSprite} sprite	The sprite to use for the box, if desired. The sprite should have at least 2 frames: 1st for deselected, 2nd for selected.
/// @return {Id.Instance}			Returns the ID of the created check box
/// @desc	This function will create a radio check box that will perform various functions when turned on or off with
///			more customization options. Unlike the normal check box, boxes created with this function can only have
///			one box selected at a time.
function check_box_radio_create_ext(__x, __y, __depth, __onFunc, __offFunc, __xscale, __yscale, __alpha, __blend, __angle, __sprite = __qolCheckBoxSpr) {
	var __radioCheckBoxInst = instance_create_depth(__x, __y, __depth, __qolCheckBoxRadio);
	
	with (__radioCheckBoxInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
		
		image_xscale = __xscale;
		image_yscale = __yscale;
		
		image_alpha = __alpha;
		image_blend = __blend;
		image_angle = __angle;
		
		sprite_index = __sprite;
	}
	
	return __radioCheckBoxInst;
}

// Option button creation function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the option button at.
/// @arg {Real} y					Y position to create the option button at.
/// @arg {Real} depth				Depth to create the button at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the option button is ON.
/// @arg {Function} offFunction		The function to be performed when the option button is OFF.
/// @return {Id.Instance}			Returns the ID of the created option button.
/// @desc	This function will create an option bullet button that will perform various functions when turned on or off.
function option_button_create(__x, __y, __depth, __onFunc, __offFunc) {
	var __optionButtonInst = instance_create_depth(__x, __y, __depth, __qolOption);
	
	with (__optionButtonInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
	}
	
	return __optionButtonInst;
}

// Option button creation function with more options.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the option button at.
/// @arg {Real} y					Y position to create the option button at.
/// @arg {Real} depth				Depth to create the button at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the option button is ON.
/// @arg {Function} offFunction		The function to be performed when the option button is OFF.
/// @arg {Real} xscale				Horizontal scaling of the option button.
/// @arg {Real} yscale				Vertical scaling of the option button.
/// @arg {Real} alpha				Alpha opacity of the option button.
/// @arg {Constant.Color} blend		The color blend of the option button. Set to c_white or -1 for no blend.
/// @arg {Real} angle				Rotation of the option button, ranging from 0 to 360.
/// @arg {Asset.GMSprite} sprite	The sprite to use for the button, if desired. The sprite should have at least 2 frames: 1st for deselected, 2nd for selected.
/// @return {Id.Instance}			Returns the ID of the created option button.
/// @desc	This function will create an option bullet button that will perform various functions when turned on or off, but
///			has more customization options. The sprite can be changed and it can be resized and blended.
function option_button_create_ext(__x, __y, __depth, __onFunc, __offFunc, __xscale, __yscale, __alpha, __blend, __angle, __sprite = __qolOptionSpr) {
	var __optionButtonInst = instance_create_depth(__x, __y, __depth, __qolOption);
	
	with (__optionButtonInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
		
		image_xscale = __xscale;
		image_yscale = __yscale;
		
		image_alpha = __alpha;
		image_blend = __blend;
		image_angle = __angle;
		
		sprite_index = __sprite;
	}
	
	return __optionButtonInst;
}

// Radio option button creation function.
/// @arg {Real} x					X position to create the option button at.
/// @arg {Real} y					Y position to create the option button at.
/// @arg {Real} depth				Depth to create the button at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the option button is ON.
/// @arg {Function} offFunction		The function to be performed when the option button is OFF.
/// @return {Id.Instance}			Returns the ID of the created option button.
/// @desc	This function will create a radio option bullet button that will perform various functions when turned on or
///			off. Unlike the normal option bullet button, buttons created with this function can only have one button
///			selected at a time.
function option_button_radio_create(__x, __y, __depth, __onFunc, __offFunc) {
	var __radioOptionButtonInst = instance_create_depth(__x, __y, __depth, __qolOptionRadio);
	
	with (__radioOptionButtonInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
	}
	
	return __radioOptionButtonInst;
}

// Radio option button creation function with more options.
// Script Origin: Wrote by IMF24
/// @arg {Real} x					X position to create the option button at.
/// @arg {Real} y					Y position to create the option button at.
/// @arg {Real} depth				Depth to create the button at. Layers are not supported.
/// @arg {Function} onFunction		The function to be performed when the option button is ON.
/// @arg {Function} offFunction		The function to be performed when the option button is OFF.
/// @arg {Real} xscale				Horizontal scaling of the option button.
/// @arg {Real} yscale				Vertical scaling of the option button.
/// @arg {Real} alpha				Alpha opacity of the option button.
/// @arg {Constant.Color} blend		The color blend of the option button. Set to c_white or -1 for no blend.
/// @arg {Real} angle				Rotation of the option button, ranging from 0 to 360.
/// @arg {Asset.GMSprite} sprite	The sprite to use for the button, if desired. The sprite should have at least 2 frames: 1st for deselected, 2nd for selected.
/// @return {Id.Instance}			Returns the ID of the created option button.
/// @desc	This function will create a radio option bullet button that will perform various functions when turned on or
///			off with more customization options. Unlike the normal option bullet button, buttons created with this function
///			can only have one button selected at a time.
function option_button_radio_create_ext(__x, __y, __depth, __onFunc, __offFunc, __xscale, __yscale, __alpha, __blend, __angle, __sprite = __qolOptionSpr) {
	var __radioOptionButtonInst = instance_create_depth(__x, __y, __depth, __qolOptionRadio);
	
	with (__radioOptionButtonInst) {
		x = __x;
		y = __y;
		depth = __depth;
		
		__onFunction = __onFunc;
		__offFunction = __offFunc;
		
		image_xscale = __xscale;
		image_yscale = __yscale;
		
		image_alpha = __alpha;
		image_blend = __blend;
		image_angle = __angle;
		
		sprite_index = __sprite;
	}
	
	return __radioOptionButtonInst;
}

// Slider creation function.
// Script Origin: Object Code by HeartBeast, Script by IMF24
/// @arg {Real} x					X position to create the slider at.
/// @arg {Real} y					Y position to create the slider at.
/// @arg {Real} depth				Depth to create the slider at. Layers are not supported.
/// @arg {Function} event			The function to be executed as the slider moves from 0 to 1.
/// @return {Id.Instance}			Returns the ID of the created slider instance.
/// @desc	Makes a slider object with a nub that can be dragged to change the value of the slider.
function slider_create(__x, __y, __depth, __event) {
	var __sliderInst = instance_create_depth(__x, __y, __depth, __qolSlider);
	
	with (__sliderInst) {
		__sliderFunction = __event;
	}
	
	return __sliderInst;
}

// Slider creation function with more options.
// Script Origin: Object Code by HeartBeast, Script by IMF24
/// @arg {Real} x					X position to create the slider at.
/// @arg {Real} y					Y position to create the slider at.
/// @arg {Real} depth				Depth to create the slider at. Layers are not supported.
/// @arg {Function} event			The function to be executed as the slider moves from 0 to 1.
/// @arg {Array<Any>} barProps		Array holding the properties for drawing the bar itself, formatted in this way: [sprite, xscale, yscale, fillColor, alpha].
/// @arg {Array<Any>} nubProps		Array holding the properties for drawing the nub (button), formatted in this way: [sprite, xscale, yscale, color, alpha, angle].
/// @return {Id.Instance}			Returns the ID of the created slider instance.
/// @desc	Makes a slider object with a nub that can be dragged to change the value of the slider, with more customization options.
function slider_create_ext(__x, __y, __depth, __event, __barProperties, __nubProperties) {
	var __sliderInst = instance_create_depth(__x, __y, __depth, __qolSlider);
	
	with (__sliderInst) {
		// Set the function.
		__sliderFunction = __event;
		
		// Bar properties.
		__barSprite = __barProperties[0];
		__barXScale = __barProperties[1];
		__barYScale = __barProperties[2];
		__barFillColor = __barProperties[3];
		__barAlpha = __barProperties[4];
		
		// Nub properties.
		__nubSprite = __nubProperties[0];
		__nubXScale = __nubProperties[1];
		__nubYScale = __nubProperties[2];
		__nubColor = __nubProperties[3];
		__nubAlpha = __nubProperties[4];
		__nubAngle = __nubProperties[5];
	}
	
	return __sliderInst;
}

#endregion

// =====================================================================================
// Draw Functions
// =====================================================================================
#region Draw Functions
// RGB function, condensed from make_color_rgb().
// Script Origin: Wrote by IMF24
/// @arg {Real} red							Amount of red.
/// @arg {Real} green						Amount of green.
/// @arg {Real} blue						Amount of blue.
/// @return {Constant.Color}				Returns a color constant.
/// @desc	Makes a color constant using RGB values. This is basically a condensed version of make_color_rgb().
function rgb(__r, __g, __b) {
	var __color = make_color_rgb(__r, __g, __b);
	return __color;
}

// HSV function, condensed from make_color_hsv().
// Script Origin: Wrote by IMF24
/// @arg {Real} hue							Hue intensity. This is the color itself.
/// @arg {Real} saturation					Saturation intensity. This is how soft or hard the color is.
/// @arg {Real} variance					Variance of color, also known as luminance or value.
/// @return {Constant.Color}				Returns a color constant.
/// @desc	Makes a color constant using HSV values. This is basically a condensed version of make_color_hsv().
function hsv(__h, __s, __v) {
	var __color = make_color_hsv(__h, __s, __v);
	return __color;
}

// Draw base setup function.
// Script Origin: Wrote by IMF24
/// @arg {Real} alpha						Alpha opacity level. Can be between 0 and 1.
/// @arg {Constant.Color} color				Color for drawing. Supports hex RGB and ARGB codes, and RGB/HSV functions.
/// @arg {Asset.GMFont} font				Font to use for text.
/// @arg {Constant.HAlign} halign			Horizontal alignment for text.
/// @arg {Constant.VAlign} valign			Vertical alignment for text.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Draw base setup function that allows for setting all draw values at once without having to call all
//			draw_set_*() functions separately.
function draw_set_base(__alpha, __color, __font, __halign, __valign) {
	// Set alpha.
	draw_set_alpha(clamp(__alpha, 0, 1));
	
	// Set color.
	draw_set_color(__color);
	
	// Set font.
	draw_set_font(__font);
	
	// Set horizontal alignment.
	draw_set_halign(__halign);
	
	// Set vertical alignment.
	draw_set_valign(__valign);
	
	// Return nothing.
	return undefined;
}

// Text draw function with base draw code.
// Script Origin: Wrote by IMF24
/// @arg {Real} x							X position to draw the text.
/// @arg {Real} y							Y position to draw the text.
/// @arg {String} text						Text string to draw to the screen.
/// @arg {Real} alpha						Alpha opacity level. Can be between 0 and 1.
/// @arg {Constant.Color} color				Color for drawing. Supports hex RGB and ARGB codes, and RGB/HSV functions.
/// @arg {Asset.GMFont} font				Font to use for text.
/// @arg {Constant.HAlign} halign			Horizontal alignment for text.
/// @arg {Constant.VAlign} valign			Vertical alignment for text.
/// @return {Undefined}
/// @desc	Text draw function that acts as a dual-purpose text draw and base draw code block all in one function.
function draw_text_base(__x, __y, __text, __alpha, __color, __font, __halign, __valign) {
	// Set base draw code.
	// Set alpha.
	draw_set_alpha(clamp(__alpha, 0, 1));
	
	// Set color.
	draw_set_color(__color);
	
	// Set font.
	draw_set_font(__font);
	
	// Set horizontal alignment.
	draw_set_halign(__halign);
	
	// Set vertical alignment.
	draw_set_valign(__valign);
	
	// Draw the desired text.
	draw_text(__x, __y, __text);
	
	// Return nothing.
	return undefined;
}

// Bar draw function based off of a single sprite with its frames.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} sprite			The sprite you wish to use for this bar.
/// @arg {Real} bg							The image index of the sprite to use as the background of the bar.
/// @arg {Real} fill						The image index of the sprite to use as the fill for the bar.
/// @arg {Real} frame						The image index of the sprite to use as a frame for the bar. If you don't want the frame, set this to -1.
/// @arg {Array<Real>} value				An array holding the variables for the current and maximum value this bar should be drawn with.
/// @arg {Real} x							The X position to draw the bar at.
/// @arg {Real} y							The Y position to draw the bar at.
/// @return {Undefined}						Doesn't return anything.
/// @desc	This function will draw a bar to the screen, using a single sprite and its frames.
function draw_bar_frame(__sprite, __bg, __fill, __frame, __value, __x, __y) {
	// Makes sure there's EXACTLY 2 entries in the value argument.
	if (array_length(__value) != 2) exit;
	
	// The bar sizes based on the image's size.
	var __barWidth = sprite_get_width(__sprite);
	var __barHeight = sprite_get_height(__sprite);
	
	// X and Y positions.
	var __barX = sprite_get_xoffset(__sprite);
	var __barY = sprite_get_yoffset(__sprite);
	
	// The background of the bar.
	draw_sprite(__sprite, __bg, __x, __y);
	
	// The fill of the bar.
	draw_sprite_part(__sprite, __fill, 0, 0, min((__value[0] / __value[1]) * __barWidth, __barWidth), __barHeight, __x - __barX, __y - __barY);
	
	// The frame on top of the bar.
	if (__frame != -1) draw_sprite(__sprite, __frame, __x, __y);
	
	// Return nothing.
	return undefined;
}

// Bar draw function based off of a single sprite with its frames, with more options.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} sprite			The sprite you wish to use for this bar.
/// @arg {Real} bg							The image index of the sprite to use as the background of the bar.
/// @arg {Real} fill						The image index of the sprite to use as the fill for the bar.
/// @arg {Real} frame						The image index of the sprite to use as a frame for the bar. If you don't want the frame, set this to -1.
/// @arg {Array<Real>} value				An array holding the variables for the current and maximum value this bar should be drawn with.
/// @arg {Real} x							The X position to draw the bar at.
/// @arg {Real} y							The Y position to draw the bar at.
/// @arg {Real} xscale						The horizontal scaling for this bar.
/// @arg {Real} yscale						The vertical scaling for this bar.
/// @arg {Constant.Color} color				The color for blending this bar. Set to c_white for no blend.
/// @arg {Real} alpha						Alpha opacity for this bar.
/// @return {Undefined}						Doesn't return anything.
/// @desc	This function will draw a bar to the screen, using a single sprite and its frames, but allows for more
///			customization over its draw options. Note that when the bar is drawn, the origin point is ignored and the
///			function will use the top left corner of the sprite(s).
function draw_bar_frame_ext(__sprite, __bg, __fill, __frame, __value, __x, __y, __xscale, __yscale, __color, __alpha) {
	// Makes sure there's EXACTLY 2 entries in the value argument.
	if (array_length(__value) != 2) exit;
	
	// The bar sizes based on the image's size.
	var __barWidth = sprite_get_width(__sprite);
	var __barHeight = sprite_get_height(__sprite);
	
	// Ignore origin point, set to (0, 0).
	sprite_set_offset(__sprite, 0, 0);
	
	// X and Y positions.
	var __barX = sprite_get_xoffset(__sprite);
	var __barY = sprite_get_yoffset(__sprite);
	
	// The background of the bar.
	draw_sprite_ext(__sprite, __bg, __x, __y, __xscale, __yscale, 0, __color, __alpha);
	
	// The fill of the bar.
	draw_sprite_part_ext(__sprite, __fill, 0, 0, min((__value[0] / __value[1]) * __barWidth, __barWidth), __barHeight, __x - __barX, __y - __barY, __xscale, __yscale, __color, __alpha);
	
	// The frame on top of the bar.
	if (__frame != -1) draw_sprite_ext(__sprite, __frame, __x, __y, __xscale, __yscale, 0, __color, __alpha);
	
	// Return nothing.
	return undefined;
}

// Bar draw function based off of more than one sprite.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} bg				The sprite to use as the background of the bar.
/// @arg {Asset.GMSprite} fill				The sprite to use as the fill for the bar.
/// @arg {Asset.GMSprite} frame				The sprite to use as the frame around the bar. If you don't want the frame, set this to noone.
/// @arg {Array<Real>} value				An array holding the variables for the current and maximum value this bar should be drawn with.
/// @arg {Real} x							The X position to draw the bar at.
/// @arg {Real} y							The Y position to draw the bar at.
/// @return {Undefined}						Doesn't return anything.
/// @desc	This function will draw a bar to the screen, using multiple sprites.
function draw_bar_sprite(__bg, __fill, __frame, __value, __x, __y) {
	// Makes sure there's EXACTLY 2 entries in the value argument.
	if (array_length(__value) != 2) exit;
	
	// The bar's BG sizes based on the image's size.
	var __barWidthBG = sprite_get_width(__bg);
	var __barHeightBG = sprite_get_height(__bg);
	
	// The bar's fill sizes based on the image's size.
	var __barWidthFill = sprite_get_width(__fill);
	var __barHeightFill = sprite_get_height(__fill);
	
	// X and Y positions.
	var __barX = sprite_get_xoffset(__fill);
	var __barY = sprite_get_yoffset(__fill);
	
	// The background of the bar.
	draw_sprite(__bg, 0, __x, __y);
	
	// The fill of the bar.
	draw_sprite_part(__fill, image_index, 0, 0, min((__value[0] / __value[1]) * __barWidthFill, __barWidthFill), __barHeightFill, __x - __barX, __y - __barY);
	
	// The frame on top of the bar.
	if (__frame != noone) draw_sprite(__frame, 0, __x, __y);
	
	// Return nothing.
	return undefined;
}

// Bar draw function based off of more than one sprite, with more options.
// Script Origin: Wrote by IMF24
/// @arg {Asset.GMSprite} bg				The sprite to use as the background of the bar.
/// @arg {Asset.GMSprite} fill				The sprite to use as the fill for the bar.
/// @arg {Asset.GMSprite} frame				The sprite to use as the frame around the bar. If you don't want the frame, set this to noone.
/// @arg {Array<Real>} value				An array holding the variables for the current and maximum value this bar should be drawn with.
/// @arg {Real} x							The X position to draw the bar at.
/// @arg {Real} y							The Y position to draw the bar at.
/// @arg {Real} xscale						The horizontal scaling for this bar.
/// @arg {Real} yscale						The vertical scaling for this bar.
/// @arg {Constant.Color} color				The color for blending this bar. Set to c_white for no blend.
/// @arg {Real} alpha						Alpha opacity for this bar.
/// @return {Undefined}						Doesn't return anything.
/// @desc	This function will draw a bar to the screen, using multiple sprites, allowing for more customization. Note that
///			when the bar is drawn, the origin point is ignored and the function will use the top left corner of the sprite(s).
function draw_bar_sprite_ext(__bg, __fill, __frame, __value, __x, __y, __xscale, __yscale, __color, __alpha) {
	// Makes sure there's EXACTLY 2 entries in the value argument.
	if (array_length(__value) != 2) exit;
	
	// The bar's BG sizes based on the image's size.
	var __barWidthBG = sprite_get_width(__bg);
	var __barHeightBG = sprite_get_height(__bg);
	
	// The bar's fill sizes based on the image's size.
	var __barWidthFill = sprite_get_width(__fill);
	var __barHeightFill = sprite_get_height(__fill);
	
	// Ignore origin point, set to (0, 0).
	sprite_set_offset(__bg, 0, 0);
	sprite_set_offset(__fill, 0, 0);
	sprite_set_offset(__frame, 0, 0);
	
	// X and Y positions.
	var __barX = sprite_get_xoffset(__bg);
	var __barY = sprite_get_yoffset(__bg);
	
	// The background of the bar.
	draw_sprite_ext(__bg, 0, __x, __y, __xscale, __yscale, 0, __color, __alpha);
	
	// The fill of the bar.
	draw_sprite_part_ext(__fill, image_index, 0, 0, min((__value[0] / __value[1]) * __barWidthFill, __barWidthFill), __barHeightFill, __x - __barX, __y - __barY, __xscale, __yscale, __color, __alpha);
	
	// The frame on top of the bar.
	if (__frame != noone) draw_sprite_ext(__frame, 0, __x, __y, __xscale, __yscale, 0, __color, __alpha);
	
	// Return nothing.
	return undefined;
}

// Draw overlay function.
// Script Origin: Wrote by IMF24
/// @arg {Real} type						Type of overlay to draw. Use ov_part or ov_full to define which one to use.
/// @arg {Constant.Color} color				The color of the overlay.
/// @arg {Real} alpha						Alpha opacity of the overlay.
/// @arg {Real} x1							PART ONLY: Top left corner's X position.
/// @arg {Real} y1							PART ONLY: Top left corner's Y position.
/// @arg {Real} x2							PART ONLY: Bottom right corner's X position.
/// @arg {Real} y2							PART ONLY: Bottom right corner's Y position.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Draws an overlay onto the screen, either on the entire screen or part of the screen.
function draw_overlay(__type, __color, __alpha, __x1 = 0, __y1 = 0, __x2 = window_get_width(), __y2 = window_get_height()) {
	// Set draw overlay and color.
	draw_set_alpha(__alpha);
	draw_set_color(__color);
	
	// Based on overlay type, draw the overlay.
	switch (__type) {
		// Part of the screen.
		case 0: draw_rectangle(__x1, __y1, __x2, __y2, 0); break;
		
		// Full screen.
		case 1: draw_rectangle(0, 0, window_get_width(), window_get_height(), 0); break;
		
		// If not valid.
		default: return undefined; break;
	}
	
	// Return nothing.
	return undefined;
}

#endregion

// =====================================================================================
// Room Functions
// =====================================================================================
#region Room Functions
// Fade to room function.
// Script Origin: Gurpreet Singh Matharoo (https://www.youtube.com/watch?v=WLQiVE_k5SA), Modified by IMF24
/// @arg {Asset.GMRoom} room				The room to go to after the screen has faded out.
/// @arg {Real} duration					The time the fade should last.
/// @arg {Constant.Color} color				The color of the fade.
/// @arg {Real} delay						Number of frames to wait before the screen fades in.
/// @return {Undefined}						Doesn't return anything.
/// @desc	This function will create a fade transition moving between rooms.
function room_goto_fade(__room, __dur, __col, __del) {
	var __fadeInst = 0;
	
	if (!instance_exists(__qolFade)) __fadeInst = instance_create_depth(0, 0, 0, __qolFade);
	
	// Set the fade properties.
	with (__fadeInst) {
		__targetRoom = __room;
		__duration = __dur;
		__color = __col;
		__delay = __del;
	}
	
	// Return nothing.
	return undefined;
}

// Cross fade to room function.
// Script Origin: Gurpreet Singh Matharoo (https://www.youtube.com/watch?v=hfwP4-UorKA)
/// @arg {Asset.GMRoom} room				The room to go to.
/// @arg {Real} duration					The time the cross fade should last.
/// @return {Undefined}						Doesn't return anything.
/// @desc	This function will create a cross fade transition moving between rooms.
function room_goto_crossfade(__room, __dur) {
	var __crossFadeInst = 0;
	
	if (!instance_exists(__qolCrossFade)) __crossFadeInst = instance_create_depth(0, 0, 0, __qolCrossFade);
	
	__crossFadeInst.__duration = __dur;
	
	// Go to room
	room_goto(__room);
	
	// Return nothing.
	return undefined;
}

#endregion

// =====================================================================================
// Window Functions
// =====================================================================================
#region Window Functions
// Full screen set function.
// Script Origin: Wrote by IMF24
/// @arg {Bool} value						Should the window be in full screen?
/// @return {Undefined}						Doesn't return anything.
/// @desc	Sets the window's full screen properties. This is a shortened version of window_set_fullscreen().
function fullscreen(__fs) { window_set_fullscreen(__fs); }

// Window set size function.
// Script Origin: Wrote by IMF24
/// @arg {Real} width						Width of the game window.
/// @arg {Real} height						Height of the game window.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Sets the dimensions of the game window. This is a shortened version of window_set_size().
function window_size(__w, __h) { window_set_size(__w, __h); }

// Window set title function.
// Script Origin: Wrote by IMF24
/// @arg {String} title						Title of the game window.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Sets the title of the game window. This is a shortened version of window_set_caption().
function window_title(__title) { window_set_caption(__title); }

// Window set minimum size function.
// Script Origin: Wrote by IMF24
/// @arg {Real} width						Minimum width of the game window.
/// @arg {Real} height						Minimum height of the game window.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Sets the minimum size that the game window can be.
function window_size_min(__w, __h) {
	window_set_min_width(__w);
	window_set_min_height(__h);
}

// Window set maximum size function.
// Script Origin: Wrote by IMF24
/// @arg {Real} width						Maximum width of the game window.
/// @arg {Real} height						Maximum height of the game window.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Sets the maximum size that the game window can be.
function window_size_max(__w, __h) {
	window_set_max_width(__w);
	window_set_max_height(__h);
}

// Window set position function.
// Script Origin: Wrote by IMF24
/// @arg {Real} x							X position of the game window.
/// @arg {Real} y							Y position of the game window.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Moves the game window to the designated (X, Y) location, relative to the monitor.
function window_position(__x, __y) { window_set_position(__x, __y); }

#endregion

// =====================================================================================
// Debug Functions
// =====================================================================================
#region Debug Functions
// Debug log add entry.
// Script Origin: Wrote by IMF24
/// @arg {String} info						The string of information to add to the debug log.
/// @arg {String} prefix					If desired, an introductory string of text will be appended to the beginning of the string.
/// @arg {Bool} print						Should this message be printed to the Output window? Default is pulled from the config macros.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Adds an entry to the global debug log.
function debug_log_add(__info, __prefix = "", __addToOutput = QOL_WRITE_DEBUG_LOG_TO_OUTPUT) {
	if (__prefix != "") __info = str(__prefix + " " + __info);
	
	if (__addToOutput) show_debug_message(__info);
	
	array_push(global.__debugLog, __info);
}

// Write debug log to text file.
// Script Origin: Wrote by IMF24
/// @arg {String} fileName					The name of the file to write to. Default is "debug.txt".
/// @arg {String} dir						The directory to save the file to. The final slash will be added before the file name. Default is the current working directory.
/// @arg {Bool} concatOld					If a backup debug log was created, should it be concatenated into the debug log?
/// @return {Id.TextFile}					Returns the text file ID created.
/// @desc	Takes the global debug log and writes its contents to a file on the system. The input directory will be created
///			if it doesn't already exist. If the debug log is empty, this does nothing.
function debug_log_export(__fileName = QOL_WRITE_DEBUG_LOG_FILE_NAME, __dir = QOL_WRITE_DEBUG_LOG_DIR, __concatOld = QOL_WRITE_DEBUG_LOG_BACKUP) {
	if (len(global.__debugLog) <= 0) exit;
	
	if (!directory_exists(__dir)) directory_create(__dir);
	
	if (file_exists(__dir + "/" + __fileName)) file_delete(__dir + "/" + __fileName);
	
	var __file = file_text_open_write(__dir + "/" + __fileName);
	
	if (__concatOld) && (len(global.__debugLogBackup) > 0) file_text_write_string(__file, "Active Debug Log:\n");
	
	for (var i = 0; i < len(global.__debugLog); i++) file_text_write_string(__file, global.__debugLog[i] + "\n");
		
	if (__concatOld) && (len(global.__debugLogBackup) > 0) {
		file_text_write_string(__file, "\nBacked Up Debug Log:\n");
		
		for (var i = 0; i < len(global.__debugLogBackup); i++) file_text_write_string(__file, global.__debugLogBackup[i] + "\n");
	}
	
	file_text_close(__file);

	return __file;
}

// Reset debug log function.
// Script Origin: Wrote by IMF24
/// @arg {Bool} backup						Do you want to back up the old debug log? Default is set in the configuration macros.
/// @arg {Bool} append						If there was a previously backed up log, should the current contents be added to it?
/// @return {Undefined}						Doesn't return anything.
/// @desc	Resets (clears) the debug log. By default, it will back up the old debug log (if enabled in configuration).
function debug_log_reset(__backup = QOL_DEBUG_LOG_BACKUP_DEFAULT, __append = QOL_DEBUG_LOG_BACKUP_APPEND) {
	if (__backup) {
		if (__append) global.__debugLogBackup = array_union(global.__debugLogBackup, global.__debugLog); else global.__debugLogBackup = global.__debugLog;
	}
	
	global.__debugLog = [];
}

// Restore old debug log function.
// Script Origin: Wrote by IMF24
/// @arg {Bool} append						Do you want to append the old debug log to the current one?
/// @arg {Real} appendPos					Where should the old data be appended to? 0 is for the beginning, and 1 is for the end.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Restores the old debug log from its backup if an existing debug log was found.
function debug_log_recall(__append, __appendPos = 0) {
	if (len(global.__debugLogBackup) > 0) {
		if (__append) {
			switch (__appendPos) {
				case 0:
					var __debugLogCurrent = global.__debugLog;
				
					global.__debugLog = global.__debugLogBackup;
					
					for (var i = 0; i < len(__debugLogCurrent); i++) array_push(global.__debugLog, __debugLogCurrent[i])
				break;
				
				case 1: for (var i = 0; i < len(global.__debugLogBackup); i++) array_push(global.__debugLog, global.__debugLogBackup[i]);
			}
		
		} else global.__debugLog = global.__debugLogBackup;
	}
}

// Message box creation function (for desktop debug).
// Script Origin: Wrote by IMF24
/// @arg {String} text						The text to show in the message window.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Opens a popup window to the user. Only works on desktop targets.
function msg(__text) { show_message(__text); }

// Asks a question via a message box function (for desktop debug).
// Script Origin: Wrote by IMF24
/// @arg {String} text						The text to show in the question window.
/// @return {Bool}							Returns a true value if Yes, false if No.
/// @desc	Asks a question by opening a popup window to the user. Only works on desktop targets.
function ask(__text) { return show_question(__text); }

// Close game function.
// Script Origin: Wrote by IMF24
/// @return {Undefined}						Doesn't return anything.
/// @desc	Closes the game window. Triggers Game End events.
function close() { game_end(); }

// URL open function.
// Script Origin: Wrote by IMF24
/// @arg {String} url						The URL of the website to open.
/// @return {Undefined}						Doesn't return anything.
/// @desc	Opens a designated URL in the device's default web browser.
function url(__url) { url_open(__url); }

// Save File dialog window.
// Script Origin: Wrote by IMF24
/// @arg {String} filter					The file type list. Format the list in this way: "<File Descriptor>|*.extension"
/// @arg {String} fileName					Suggested file name, if desired.
/// @arg {String} dir						The default directory to use.
/// @arg {String} title						The window title.
/// @return {String}						Returns the directory provided in the Save File dialog.
/// @desc	Asks the user for where to save a given file on the device, and returns its save location as a string. Note that
///			this function is only effective on Windows and Mac OS export targets!
function ask_save_filename(__filter, __fileName, __dir, __title) { return get_save_filename_ext(__filter, __fileName, __dir, __title); }

// Open File dialog window.
// Script Origin: Wrote by IMF24
/// @arg {String} filter					The file type list. Format the list in this way: "<File Descriptor>|*.extension"
/// @arg {String} fileName					Suggested file name, if desired.
/// @arg {String} dir						The default directory to use.
/// @arg {String} title						The window title.
/// @return {String}						Returns the directory provided in the Open File dialog.
/// @desc	Asks the user for a file on the device, and returns its path location as a string. Note that this function is only
///			effective on Windows and Mac OS export targets!
function ask_open_filename(__filter, __fileName, __dir, __title) { return get_open_filename_ext(__filter, __fileName, __dir, __title); }

// Opens the debug command prompt.
// Script Origin: Wrote by IMF24
/// @return {Id.Instance}					Returns the instance ID of the created prompt instance.
/// @desc	Opens the QOL Library debug command log. Returns the ID of the prompt instance.
function debug_command_open() { if (!instance_exists(__qolCommandPrompt)) instance_create_depth(0, 0, 0, __qolCommandPrompt); }

// Closes the debug command prompt.
// Script Origin: Wrote by IMF24
/// @return {Undefined}						Doesn't return anything.
/// @desc	Closes the QOL Library debug command log.
function debug_command_close() { instance_destroy(global.__activeCommandInstance); }

// The function call used by the QOL_BETTER_ERRORS macro.
// This will only be run if that macro is set to true.
if (QOL_BETTER_ERRORS) exception_unhandled_handler(function (__exception) {
	// Show a new crash error window.
	show_message(
		"=============================\n" +
		"	    QOL BETTER ERRORS\n" +
		"=============================\n" +
		"\nThe game has crashed!\n" + 
		"------------------------------------------\n" +
		"Brief error information: " + __exception.message + "\n" + 
		"------------------------------------------\n" + 
		"The error originated in this script: " + __exception.script + "\n" +
		"------------------------------------------\n" + 
		"The error is on this line: Line " + string(__exception.line) + "\n" +
		"------------------------------------------\n" + 
		"The call stack is as follows:\n" + string(__exception.stacktrace) + "\n" +
		"------------------------------------------\n" +
		"Full Error Information:\n\n" + __exception.longMessage + "\n" +
		"------------------------------------------\n" +
		"To disable GM QOL Better Errors, go to the __scrQOLConfig script in the QOL Library folder, and set QOL_BETTER_ERRORS to false."
	);
	
	// Write text file documenting the most recent crash to the computer.
	if (QOL_WRITE_ERROR_TXT) {
		// Is there already a file with the desired name? If so, delete it, since we'll re-create it.
		if (file_exists(QOL_WRITE_ERROR_FILE_NAME)) file_delete(QOL_WRITE_ERROR_FILE_NAME);
		
		// Open a new text file and write the crash error information to it.
		var __f = file_text_open_write(QOL_WRITE_ERROR_FILE_NAME);
		file_text_write_string(__f, string(__exception));
		file_text_close(__f);
		
		// Show a new window telling the user that a text file has been saved in the local project's directory.
		show_message("A text file documenting the last crash can be found in the local directory as \"" + QOL_WRITE_ERROR_FILE_NAME + "\".");
	}
});

#endregion

// =====================================================================================
// Deprecated Functions
// =====================================================================================
#region Deprecated Functions
// *** ALL FUNCTIONS UNDER THIS SECTION ARE DEPRECATED! Their use is highly discouraged and no support will be given for scripts that use these functions.

	// No functions are deprecated yet.

#endregion

// =====================================================================================
// Start Up Actions
// =====================================================================================
#region Start Up Actions
// Show current version (start of QOL load).
show_debug_message("[QOL Library] GM QOL library installed! Version: V" + QOL_VERSION);

// Show loading messages if allowed.
if (QOL_SHOW_LOADING) {
	// Run the full screen set function based on the config value.
	if (QOL_ALLOW_START_FULL_SCREEN) {
		show_debug_message("[OQL Library] QOL full screen handler allowed, setting window full screen to " + string(QOL_START_FULL_SCREEN));
		window_set_fullscreen(QOL_START_FULL_SCREEN);
		show_debug_message("[OQL Library] Window full screen set to " + string(QOL_START_FULL_SCREEN));
	} else show_debug_message("[OQL Library] QOL full screen handler disallowed; Skipping...");

}

// Show when load has completed.
show_debug_message("[QOL Library] GM QOL library fully loaded!");

#endregion