// QUALITY OF LIFE FUNCTIONS SCRIPT BY IMF24, ET AL.
// GM QOL CONFIG SCRIPT
// Edit these macros and settings to your liking!

// =====================================================================================
// QOL General Macros
// =====================================================================================
#region QOL General Macros
// Show the loading messages in the Output window when the game is compiling?
#macro QOL_SHOW_LOADING true

#endregion

// =====================================================================================
// Debug Macros
// =====================================================================================
#region Debug Macros
// Use better error messages?
// These error messages will override the default GameMaker error messages with more clear and concise ones.
#macro QOL_BETTER_ERRORS true

// Write error messages to text files?
// Note: You must have file sandboxing disabled in order for this to work!
#macro QOL_WRITE_ERROR_TXT true

// Name of the text file holding the last crash's information.
// This should be a string that holds a valid file name. TXT is preferable.
#macro QOL_WRITE_ERROR_FILE_NAME "last_crash.txt"

// Name of the text file holding the debug log, if being utilized.
// This should be a string that holds a valid file name. TXT is preferable.
#macro QOL_WRITE_DEBUG_LOG_FILE_NAME "debug.txt"

// The directory to save the debug log file to.
#macro QOL_WRITE_DEBUG_LOG_DIR working_directory

// Should things added to the debug log also be printed to the Output window?
#macro QOL_WRITE_DEBUG_LOG_TO_OUTPUT true

// If there's a backup debug log active, should it be added into the debug log when exported?
#macro QOL_WRITE_DEBUG_LOG_BACKUP true

// Should the debug log be backed up by default when cleared?
#macro QOL_DEBUG_LOG_BACKUP_DEFAULT true

// If there's a backup debug log active, when the active log is cleared, should the active log's contents be added into the backup?
#macro QOL_DEBUG_LOG_BACKUP_APPEND true

#endregion

// =====================================================================================
// Window Macros
// =====================================================================================
#region Window Macros
// Should the library allow the game start in full screen? 
#macro QOL_ALLOW_START_FULL_SCREEN false

// Should the game start in full screen? 
#macro QOL_START_FULL_SCREEN false

#endregion

// =====================================================================================
// Draw & Object Macros
// =====================================================================================
#region Draw & Object Macros
// The default alpha that QOL assets should use.
#macro QOL_DEFAULT_ALPHA 1

// The default font that QOL assets should use when text is drawn.
#macro QOL_DEFAULT_FONT __qolFont

// The default text color that QOL assets should use.
#macro QOL_DEFAULT_TEXT_COLOR c_black

// The default horizontal alignment of text that QOL assets will use.
#macro QOL_DEFAULT_HALIGN fa_left

// The default vertical alignment of text that QOL assets will use.
#macro QOL_DEFAULT_VALIGN fa_middle

// The default blend color that QOL assets will use.
#macro QOL_DEFAULT_BLEND c_white

#endregion