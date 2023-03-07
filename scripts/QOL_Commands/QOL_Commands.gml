/*	The main config script for the QOL command prompt.

	To add custom commands, go to the QOL_Custom_Commands script.

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
	"restart",
	"ver",
	"version",
	"cfu",
	"crash",
	"window",
	"dir",
	"asset",
	"id",
	"ban",
	"pardon",
	"deactivate",
	"activate",
	"print",
	"docs",
	"documentation",
	"room",
	"instance",
	"draw"
]

// List of command actions (as functions).
global.__debugActions = [
	// /help
	function () {
		with (global.__activeCommandInstance) {
			__cmdOutputLog += "\n\n-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-\n-~-~-~- QOL COMMAND PROMPT HELP -~-~-~-\n-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-\n\n"
							+ "VERSION 1.1\n\nList of Commands:\n"
							+ "/help, /? - Prints this message.\n"
							+ "/docs, /documentation - Opens the GM QOL Documentation pages.\n"
							+ "/clear, /cls - Clears the console.\n"
							+ "/exit - Close the command window.\n"
							+ "/shutdown - Close the game.\n"
							+ "/restart - Restarts the game.\n"
							+ "/ver, /version - Shows the currently installed version of GM QOL.\n"
							+ "/cfu - Check for updates for the GM QOL Library.\n"
							+ "/crash - Induce game crash (unhandled).\n"
							+ "/window <w|h|x|y|name|size|pos> [value]/<x> <y> - Handles various window properties.\n"
							+ "/dir - Get the current working directory.\n"
							+ "/asset <name> - Returns the type of asset a given ID is, if it exists.\n"
							+ "/id - Lists every active instance in the room, with its name and ID.\n"
							+ "/ban <object> [id], /deactivate <object> [id] - Deactivates all instances of an object or a certain instance by its ID.\n"
							+ "/pardon <object>, /activate <object> - Activates all instances of the provided object.\n"
							+ "/print <msg> - Prints a message to the Output window in the IDE.\n"
							+ "/room <next|previous|exists|goto> [<id|next|previous>] - Go to or check various aspects on rooms.\n"
							+ "/instance <create|destroy|exists> <x|id_or_object> [<y>] <object> <depth|layer> <d|l> - Add, destroy, or check instances.\n"
							
							+ "\n" + global.__debugCustomCommandHelp;
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
	
	// /restart
	function () { restart(); },
	
	// /ver
	function () {
		with (global.__activeCommandInstance) __cmdOutputLog += "\nYou are currently running GM QOL Version " + QOL_VERSION + "\nRun /cfu to check for updates";
	},
	
	// /version
	function () { global.__debugActions[7](); },
	
	// /cfu
	function () {
		url("https://sites.google.com/view/gm-qol/downloads");
	},
	
	// /crash
	function () { throw ("Crash: Induced from debug command log."); },
	
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
						__cmdOutputLog += "\nUsage: /window <w|h|x|y|name|size> [value]/<x> <y>"
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
			if (global.__commandArgCount > 1) var __instIndex = asset_get_index(global.__commandArgs[1]);
			switch (global.__commandArgCount) {
				case 1:
					__cmdOutputLog += "\nUsage: /ban <object> [id]";
				break;

				case 2:
					if (__instIndex != -1) && (instance_exists(__instIndex)) {
						instance_deactivate_object(__instIndex);
						__cmdOutputLog += "\nAll instances of object \"" + global.__commandArgs[1] + "\" have been deactivated";
					} else {
						__cmdOutputLog += "\nThat instance does not exist! It was either deactivated or never existed.";
					}
					
				break;
				
				case 3:
					if (__instIndex != -1) && (instance_exists(instance_find(__instIndex, int(global.__commandArgs[2])))) {
						instance_deactivate_object(instance_find(__instIndex, int(global.__commandArgs[2])));
						__cmdOutputLog += "\nThe instance " + global.__commandArgs[1] + " with the ID of " + global.__commandArgs[2] + " has been deactivated";
					} else {
						__cmdOutputLog += "\nThat instance does not exist! It was either deactivated or never existed.";
					}
				break;
				
				default:
					__cmdOutputLog += "\nInvalid argument count! Usage: /ban <object> [id]";
				break;
			}
		}
	},
	
	// /pardon
	function () {
		with (global.__activeCommandInstance) {
			if (global.__commandArgCount > 1) var __instIndex = asset_get_index(global.__commandArgs[1]);
			switch (global.__commandArgCount) {
				case 1:
					__cmdOutputLog += "\nUsage: /pardon <object>";
				break;

				case 2:
					if (__instIndex != -1) {
						instance_activate_object(__instIndex);
						__cmdOutputLog += "\nAll instances of object \"" + global.__commandArgs[1] + "\" have been activated";
					} else {
						__cmdOutputLog += "\nNothing changed; the instance(s) is/are already active or it doesn't exist";
					}
				break;

				
				default:
					__cmdOutputLog += "\nInvalid argument count! Usage: /pardon <object>";
				break;
			}
		}
	},
	
	// /deactivate
	function () { global.__debugActions[15](); },
	
	// /activate
	function () { global.__debugActions[16](); },
	
	// /print
	function () {
		if (global.__commandArgCount < 2) {
			with (global.__activeCommandInstance) __cmdOutputLog += "\nUsage: /print <msg>";
		} else {
			var __printString = "";
			for (var i = 1; i < global.__commandArgCount; i++) __printString += global.__commandArgs[i] + " ";
			__printString = string_trim_end(__printString);
			show_debug_message(__printString);
		}
	},
	
	// /docs
	function () { url("https://sites.google.com/view/gm-qol-docs/home"); },
	
	// /documentation
	function () { global.__debugActions[20](); },
	
	// /room
	function () {
		with (global.__activeCommandInstance) {
			switch (global.__commandArgCount) {
				case 1:
					__cmdOutputLog += "\nUsage: /room <next|previous|exists|goto> [<id|next|previous>]";
				break;
				
				case 2:
					switch (global.__commandArgs[1]) {
						case "next":
							if (room_next(room) > -1) __cmdOutputLog += "\nTrue"; else __cmdOutputLog += "\nFalse";
						break;
						
						case "previous":
							if (room_previous(room) > -1) __cmdOutputLog += "\nTrue"; else __cmdOutputLog += "\nFalse";
						break;
						
						case "exists":
							__cmdOutputLog += "\nInvalid argument count! /room exists <id>";
						break;
						
						case "goto":
							__cmdOutputLog += "\nInvalid argument count! /room goto <id|next|previous>";
						break;
						
						default:
							__cmdOutputLog += "\nUnknown argument! Usage: /room <next|previous|exists|goto> [<id|next|previous>]";
						break;
					}
				break;
				
				case 3:
					var __targetRoom;
				
					switch (global.__commandArgs[1]) {
						case "exists":
							 __targetRoom = (asset_get_index(global.__commandArgs[2]) > -1) ? asset_get_index(global.__commandArgs[1]) : 0;
							if (room_exists(__targetRoom)) __cmdOutputLog += "\nTrue"; else __cmdOutputLog += "\nFalse";
						break;
						
						case "goto":
							switch (global.__commandArgs[2]) {
								case "next":
									if (room_next(room)) {
										room_goto_next();
										__cmdOutputLog += "\nTransferred to next room (ID " + str(room + 1) + ")";
									} else {
										__cmdOutputLog += "\nCan't advance rooms! This is the last room!";
									}
								break;
								
								case "previous":
									if (room_previous(room)) {
										room_goto_previous();
										__cmdOutputLog += "\nTransferred to previous room (ID " + str(room - 1) + ")";
									} else {
										__cmdOutputLog += "\nCan't advance rooms! This is the first room!";
									}
								break;
								
								default:
									__targetRoom = (asset_get_index(global.__commandArgs[2]) > -1) ? asset_get_index(global.__commandArgs[1]) : 0;
									if (room_exists(__targetRoom)) {
										room_goto(__targetRoom);
										__cmdOutputLog += "\nTransferred to room " + global.__commandArgs[2] + " (ID " + str(__targetRoom) + ")";
									} else {
										__cmdOutputLog += "\nCan't advance rooms! Either that room does not exist or it has been misspelled.";
									}
								break;
							}
						break;
					}				
				break;
			}
		}
	},

	// /instance
	function () {
		with (global.__activeCommandInstance) {
			switch (global.__commandArgCount) {
				case 1:
					__cmdOutputLog += "\nUsage: /instance <create|destroy|exists> <x|id_or_object> [<y>] <object> <depth|layer> <d|l>";
				break;
				
				case 2:
					switch (global.__commandArgs[1]) {
						case "create":
							__cmdOutputLog += "\nInvalid argument count! /instance create <x> <y> <object> <depth|layer> <d|l>";
						break;
						
						case "destroy":
							__cmdOutputLog += "\nInvalid argument count! /instance destroy <id_or_object>";
						break;
						
						case "exists":
							__cmdOutputLog += "\nInvalid argument count! /instance exists <id_or_object>";
						break;
						
						default:
							__cmdOutputLog += "\nUnknown argument! Usage: /instance <create|destroy|exists> <x|id_or_object> [<y>] <object> <depth|layer> <d|l>";
						break;
					}
				break;
				
				case 3:
					var __instExists = (asset_get_index(global.__commandArgs[2]) > -1) ? instance_exists(asset_get_index(global.__commandArgs[2])) : false;
					
					switch (global.__commandArgs[1]) {
						case "create":
							__cmdOutputLog += "\nInvalid argument count! /instance create <x> <y> <object> <depth|layer> <d|l>";
						break;
						
						case "destroy":
							if (global.__commandArgs[2] == "all") {
								instance_destroy(all);
							} else if (__instExists) {
								instance_destroy(asset_get_index(global.__commandArgs[2]));
								__cmdOutputLog += "\nAll instances of object " + global.__commandArgs[2] + " have been destroyed";
							}
						break;
						
						case "exists":
							if (__instExists) __cmdOutputLog += "\nTrue"; else __cmdOutputLog += "\nFalse";
						break;
						
						default:
							__cmdOutputLog += "\nUnknown argument! Usage: /instance <create|destroy|exists> <x|id_or_object> [<y>] <object> <depth|layer> <d|l>";
						break;
					}
				break;
				
				case 4: case 5:
					__cmdOutputLog += "\nInvalid argument count! /instance create <x> <y> <object> <depth|layer> <d|l>";
				break;
				
				case 6:
					if (global.__commandArgs[5] != "depth") && (global.__commandArgs[5] != "layer") {
						__cmdOutputLog += "\nUnknown argument! Usage: /instance create <x> <y> <object> <depth|layer> <d|l>";
					}
				break;
				
				case 7:
					var __assetIndex = (asset_get_index(global.__commandArgs[4]) > -1) ? asset_get_index(global.__commandArgs[4]) : int(global.__commandArgs[4]);
				
					var __x = int(global.__commandArgs[2]);
					var __y = int(global.__commandArgs[3]);
					var __d = int(global.__commandArgs[6]);
					var __l = (layer_exists(global.__commandArgs[6])) ? global.__commandArgs[6] : 0;
					var __obj = __assetIndex;
					var __instID;
				
					switch (global.__commandArgs[5]) {
						case "depth":
							__instID = instance_create_depth(__x, __y, __d, __obj);
							__cmdOutputLog += "\nObject instance of " + global.__commandArgs[4] + " created successfully (ID: " + str(__instID) + ")";
						break;
						
						case "layer":
							__instID = instance_create_layer(__x, __y, __l, __obj);
							__cmdOutputLog += "\nObject instance of " + global.__commandArgs[4] + " created successfully (ID: " + str(__instID) + ")";
						break;
						
						default:
							__cmdOutputLog += "\nUnknown argument! Usage: /instance create <x> <y> <object> <depth|layer> <d|l>";
						break;
					}
				break;
			}
		}
	},
	
	// /draw
	function () {
		with (global.__activeCommandInstance) {
			switch (global.__commandArgCount) {
				case 1: default:
					__cmdOutputLog += "\nUsage: /draw <text|image|shape> <x> <y> <str|sprite>"
				break;
				
				case 2: case 3: case 4:
					__cmdOutputLog += "\nInvalid argument count! Usage: /draw <text|image|shape> <x> <y> <str|sprite>"
				break;
			}
		
			if (global.__commandArgCount >= 5) {
				switch (global.__commandArgs[1]) {
					case "text":
						// Add an instance to the room.
						var __inst = instance_create_depth(0, 0, 0, __qolCmdDrawText);
							
						var __textToUse = "";
							
						for (var i = 4; i < len(global.__commandArgs); i++) __textToUse += global.__commandArgs[i] + " "
						__textToUse = string_trim_end(__textToUse);
							
						with (__inst) {
							__x = int(global.__commandArgs[2]);
							__y = int(global.__commandArgs[3]);
							__text = __textToUse;
						}
							
						__cmdOutputLog += "\nAdded text string \"" + str(__textToUse) + "\" at the (X, Y) position (" + global.__commandArgs[2] + ", " + global.__commandArgs[3] + ")";
					break;
				}
			}
		}
	}
]

// The current instance for the command prompt. Updated at runtime when a command prompt instance is created.
global.__activeCommandInstance = noone;

// The command queue. When the up or down arrows are pressed, cycle through this array.
global.__debugCommandQueue = [];