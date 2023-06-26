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
	// Was nothing typed in?
	if (__text == "") {
		__cmdOutputLog += "\nNo command entered! Type /help for a list of commands.";
		exit;
	}
	
	// Add the input command to the end of the command queue.
	array_push(global.__debugCommandQueue, __text);
	
	// Update the queue index.
	__cmdQueueIndex = len(global.__debugCommandQueue) - 1;
	
	// Now we'll parse the command!
	var __commandString = __text;
	
	global.__commandArgs = string_split(__commandString, " ");
	global.__commandArgCount = len(global.__commandArgs);
	
	var __commandRoot = global.__commandArgs[0];
	
	var __commandFound = false;
	
	var __commandIndex = 0;
	
	// In the array of command names, look through them and see if we find a match.
	for (var i = 0; i < len(__commandBank); i++) {
		// If the root command matches, we know it's a valid command!
		// We can break out of the loop in this case.
		if (__commandRoot == __commandBank[i]) {
			__commandFound = true;
			__commandIndex = i;
			break;
		}
		
		// At the end of the loop, if the root command didn't match any command names, it's NOT a valid command!
		if (i == len(__commandBank)) __commandFound = false;
	}
	
	// If the command was found, execute its function.
	if (__commandFound) {
		__actionsBank[__commandIndex]();
	
	// If not, we can just tell the user it was an invalid command.
	} else {
		__cmdOutputLog += "\nThe command \"" + str(__commandRoot) + "\" does not exist. Type /help for a list of commands."
	}
	
	// Reset the text input field.
	__text = "";
	
	// DEBUG: Print the command queue.
	// print(global.__debugCommandQueue);
}

// Load previous commands.
if (len(global.__debugCommandQueue) > 0) {
	var __up, __down;
	
	__up = keyboard_check_pressed(vk_up);
	__down = keyboard_check_pressed(vk_down);
	
	if (__up) || (__down) {
		if (__cmdQueueIndex >= len(global.__debugCommandQueue)) {
			__text = "";
			exit;
			
		} else __text = global.__debugCommandQueue[__cmdQueueIndex];
	}
		
	if (__up) {
		if (__cmdQueueIndex > 0) __cmdQueueIndex--;
	}
	
	if (__down) {
		if (__cmdQueueIndex < len(global.__debugCommandQueue)) __cmdQueueIndex++;
	}
}