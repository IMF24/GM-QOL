/*	The main config script for the QOL command prompt.

	TO ADD COMMANDS:
	1) In the first array, add a string for the command name.
	2) In the second array, relative to the array index of the command you just made, declare a function to use for the command you declared.

	This article contains information regarding new script format as of GM Version 2.3.0:
	https://help.yoyogames.com/hc/en-us/articles/360005277377
*/

// List of commands (as strings).
global.__debugCommands = [
	"help",
	"?",
	"clear",
	"cls",
	"exit",
	"shutdown",
	"window",
	"dir",
	"asset",
	"id",
	"ban",
	"pardon",
	"deactivate",
	"activate",
	"print"
]

// List of command actions (as functions).
global.__debugActions = [
	// /help
	function () {
		with (global.__activeCommandInstance) {
			__cmdOutputLog += "\n\n-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-\n-~-~-~- QOL COMMAND PROMPT HELP -~-~-~-\n-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-\n\n"
							+ "VERSION 1.0\n\nList of Commands:\n"
							+ "/help, /? - Prints this message.\n"
							+ "/clear, /cls - Clears the console.\n"
							+ "/exit - Close the command window.\n"
							+ "/shutdown - Close the game.\n"
							+ "/window <w|h|x|y|name|size|pos> [value]/<x> <y>\n"
							+ "/dir - Get the current working directory.\n"
							+ "/asset <name> - Returns the type of asset a given ID is, if it exists.\n"
							+ "/id - Lists every active instance in the room, with its name and ID.\n"
							+ "/ban <id/object>, /deactivate <id/object> - Deactivates the provided instance.\n"
							+ "/pardon <id/object>, /activate <id/object> - Activates the provided instance.\n"
							+ "/print <msg> - Prints a message to the Output window in the IDE.";
		}
	},
	
	// /?
	function () {
		global.__debugActions[0]();
	},
	
	// /clear
	function () {
		with (global.__activeCommandInstance) __cmdOutputLog = "";
	},
	
	// /cls
	function () {
		global.__debugActions[2]();
	},
	
	// /exit
	function () {
		with (global.__activeCommandInstance) instance_destroy();
	},
	
	// /shutdown
	function () { close(); },
	
	// /window
	function () {
		if (global.__commandArgCount < 2) {
			with (global.__activeCommandInstance) __cmdOutputLog += "\nUsage: /window <w|h|x|y|name|size|pos> [value]/<x> <y>"
		} else {
			with (global.__activeCommandInstance) {
				switch (global.__commandArgs[1]) {
					case "w":
						if (global.__commandArgCount > 2) {
							__cmdOutputLog += "\nInvalid argument count! Are you trying to resize the window (/window size <w> <h>)?"
						} else {
							var __windowWidth = str(window_get_width());
							__cmdOutputLog += "\nWindow is " + __windowWidth + " pixels wide";
						}
					break;
						
					case "h":
						if (global.__commandArgCount > 2) {
							__cmdOutputLog += "\nInvalid argument count! Are you trying to resize the window (/window size <w> <h>)?"
						} else {
							var __windowHeight = str(window_get_height());
							__cmdOutputLog += "\nWindow is " + __windowHeight + " pixels tall";
						}
					break;
						
					case "x":
						if (global.__commandArgCount > 2) {
							__cmdOutputLog += "\nInvalid argument count! Are you trying to reposition the window (/window pos <x> <y>)?" 
						} else {
							var __windowX = str(window_get_x());
							__cmdOutputLog += "\nWindow is located at the X position " + __windowX;
						}
					break;
							
					case "y":
						if (global.__commandArgCount > 2) {
							__cmdOutputLog += "\nInvalid argument count! Are you trying to reposition the window (/window pos <x> <y>)?" 
						} else {
							var __windowY = str(window_get_y());
							__cmdOutputLog += "\nWindow is located at the Y position " + __windowY;
						}
					break;
							
					case "name":
						if (global.__commandArgCount > 2) {
							var __newCaption = "";
							for (var i = 2; i < global.__commandArgCount; i++) __newCaption += global.__commandArgs[i] + " ";
							__newCaption = string_trim_end(__newCaption);
							window_set_caption(__newCaption);
							__cmdOutputLog += "\nWindow title updated to \"" + __newCaption + "\"";
						} else {
							var __windowName = window_get_caption();
							__cmdOutputLog += "\nWindow title: \"" + __windowName + "\"";
						}
					break;
					
					case "size":
						if (global.__commandArgCount < 4) {
							__cmdOutputLog += "\nInvalid argument count! Usage: /window size <w> <h>";
						} else {
							window_size(int(global.__commandArgs[2]), int(global.__commandArgs[3]));
							__cmdOutputLog += "\nWindow resized to " + global.__commandArgs[2] + " X " + global.__commandArgs[3];
						}
					break;
					
					case "pos":
						if (global.__commandArgCount < 4) {
							__cmdOutputLog += "\nInvalid argument count! Usage: /window pos <x> <y>";
						} else {
							window_position(int(global.__commandArgs[2]), int(global.__commandArgs[3]));
							__cmdOutputLog += "\nWindow relocated to the (X, Y) position (" + global.__commandArgs[2] + ", " + global.__commandArgs[3] + ")";
						}
					break;
					
					default:
						__cmdOutputLog += "Usage: /window <w|h|x|y|name|size> [value]/<x> <y>"
					break;
				}
			}
		}
	},
	
	// /dir
	function () {
		with (global.__activeCommandInstance) {
			if (global.__commandArgCount < 2) {
				__cmdOutputLog += "\nActive Working Directory: " + working_directory;
			} else {
				__cmdOutputLog += "\nInvalid argument count! The working directory is read-only and cannot be changed.";
			}
		}
	},
	
	// /asset
	function () {
		with (global.__activeCommandInstance) {
			if (global.__commandArgCount == 2) {
				var __assetType = asset_get_type(global.__commandArgs[1]);
				switch (__assetType) {
					case asset_object:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMObject";
					break;
					
					case asset_sprite:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMSprite";
					break;
					
					case asset_room:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMRoom";
					break;
					
					case asset_script:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMScript";
					break;
					
					case asset_font:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMFont";
					break;
					
					case asset_sound:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMSound";
					break;
					
					case asset_tiles:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMTileSet";
					break;
					
					case asset_shader:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMShader";
					break;
					
					case asset_sequence:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMSequence";
					break;
					
					case asset_path:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMPath";
					break;
					
					case asset_animationcurve:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMAnimCurve";
					break;
					
					case asset_timeline:
						__cmdOutputLog += "\nThe asset " + global.__commandArgs[1] + " is the type Asset.GMTimeline";
					break;
					
					case asset_unknown:
						__cmdOutputLog += "\nThe given asset name is of an unknown asset type";
					break;
					
					default:
						__cmdOutputLog += "\nNo data found, this is BAD!"					
					break;
				}
			} else {
				__cmdOutputLog += "\nUsage: /asset <name>"
			}
		}
	},
	
	// /id
	function () {
		with (global.__activeCommandInstance) {	
			__cmdOutputLog += "\nActive Instance ID List:\n";
			
			for (var i = 0; i < instance_count; i++) __cmdOutputLog += "\nName: " + object_get_name(instance_id[i].object_index) + "; ID: " + string(instance_id[i]);
		}
	},
	
	// /ban
	function () {
		with (global.__activeCommandInstance) {
			if (global.__commandArgCount < 2) || (global.__commandArgCount > 2) {
				__cmdOutputLog += "\nInvalid argument count! Usage: /ban <id/object>";
			} else {
				var __instIndex = asset_get_index(global.__commandArgs[1]);
				if (instance_exists(__instIndex)) {
					instance_deactivate_object(__instIndex);
					__cmdOutputLog += "\nAll instances of object \"" + global.__commandArgs[1] + "\" have been deactivated";
				} else {
					__cmdOutputLog += "\nThat instance does not exist! It was either deactivated or never existed.";
				}
			}
		}
	},
	
	// /pardon
	function () {
		with (global.__activeCommandInstance) {
			if (global.__commandArgCount < 2) || (global.__commandArgCount > 2) {
				__cmdOutputLog += "\nInvalid argument count! Usage: /pardon <id/object>";
			} else {
				var __instIndex = asset_get_index(global.__commandArgs[1]);
				if (!instance_exists(__instIndex)) {
					instance_activate_object(__instIndex);
					__cmdOutputLog += "\nAll instances of object \"" + global.__commandArgs[1] + "\" have been activated";
				} else {
					__cmdOutputLog += "\nThe instance(s) is/are already active, nothing changed";
				}
			}
		}
	},
	
	// /deactivate
	function () { global.__debugActions[10](); },
	
	// /activate
	function () { global.__debugActions[11](); },
	
	// /print
	function () {
		if (global.__commandArgCount < 2) {
			with (global.__activeCommandInstance) __cmdOutputLog += "\nUsage: /print <msg>"
		} else {
			var __printString = "";
			for (var i = 1; i < global.__commandArgCount; i++) __printString += global.__commandArgs[i] + " ";
			__printString = string_trim_end(__printString);
			show_debug_message(__printString);
		}
	}
]

// The current instance for the command prompt. Updated at runtime when a command prompt instance is created.
global.__activeCommandInstance = 0;