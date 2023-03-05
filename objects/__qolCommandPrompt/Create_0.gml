/// @desc Initialize text box variables
__deleteTimer = 10;
__deleteTimer = round(__deleteTimer);
__text = "";
__hintTextListen = "Type Command Here...";
__hintTextInterpret = "";
__charLimit = 0;
__charLimit = round(int(__charLimit));

__cmdOutputLog = "";

__commandBank = global.__debugCommands;
__actionsBank = global.__debugActions;

__cmdQueueIndex = len(global.__debugCommandQueue) - 1;