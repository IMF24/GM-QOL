/// @desc Do input key press handling
// Set room location.
x = 16;
y = room_height - 12;

global.__activeCommandInstance = id;

// Input logic.
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

// When the user pushes the Enter key, process the command.
if (keyboard_check_pressed(vk_enter)) {
	if (__text == "") {
		__cmdOutputLog += "\nNo command entered! Type /help for a list of commands.";
		exit;
	}
	
	global.__commandString = __text;
	global.__commandArgs = string_split(global.__commandString, " ");
	global.__commandArgCount = len(global.__commandArgs);
	global.__commandRoot = global.__commandArgs[0];
	var __commandFound = false;
	var __commandIndex = 0;
	
	for (var i = 0; i < len(global.__debugCommands); i++) {
		if (global.__commandRoot == global.__debugCommands[i]) {
			__commandFound = true;
			__commandIndex = i;
			break;
		}
		
		if (i == len(global.__debugCommands)) __commandFound = false;
	}
	
	if (__commandFound) {
		global.__debugActions[__commandIndex]();
	} else {
		__cmdOutputLog += "\nThe command \"" + global.__commandRoot + "\" does not exist."
	}
	
	__text = "";
}