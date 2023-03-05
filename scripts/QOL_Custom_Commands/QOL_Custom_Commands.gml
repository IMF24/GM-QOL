/*	If you wish to add custom commands to the QOL Command Prompt, you're in the right place!
	
	In the arrays below, you can add in your various commands. When the game is compiled,
	these will be added into the bank of commands.
	
	Write help messages too to help differentiate what your commands do if you please!
	
	To create a custom command:
	1) Add the command's name as a string to the custom commands array.
	2) In the actions array, add that command's function with its index RELATIVE to where
	   the command is placed.
	-> Example: If you create a command called "message", and its index in the commands array is 0,
				the function that will be executed when the message command is run is the
				function located at index 0 in the actions array.
				
	I've added an example in the arrays already so you can get an idea for how it works!
*/
// Add your custom commands here.
global.__debugCustomCommands = [
	"custom"
]

// Add what each of your commands do here.
global.__debugCustomActions = [
	// Example: /custom
	function () {
		with (global.__activeCommandInstance) __cmdOutputLog += "This is a custom command!";
	}
]

// Add a help message here for what each of your commands do if you wish!
global.__debugCustomCommandHelp = "To add custom commands, open the QOL_Custom_Commands script and add your commands there!";

// Appends the contents of your custom commands to the main command bank.
for (var i = 0; i < len(global.__debugCustomCommands); i++) array_push(global.__debugCommands, global.__debugCustomCommands[i]);
for (var i = 0; i < len(global.__debugCustomActions); i++) array_push(global.__debugActions, global.__debugCustomActions[i]);