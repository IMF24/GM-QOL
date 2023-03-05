// QUALITY OF LIFE FUNCTIONS SCRIPT BY IMF24, ET AL.
// GM QOL CONSTANTS

// QOL current version.
#macro QOL_VERSION "1.3"

// Debug log global variables.
global.__debugLog = [];
global.__debugLogBackup = global.__debugLog;

// Color constants.
#macro c_plum #CC00FF
#macro c_midnight #002060
#macro c_blgray #292D3E

// Dark overlay types.
#macro ov_part 0
#macro ov_full 1

// The set frame rate of the game.
#macro game_fps game_get_speed(gamespeed_fps)

// Macros for determining cursor type.
#macro cr_normal 0
#macro cr_sprite 1

// Cardinal directions.
#macro cardinal_4dir (round(direction / 90) > 3) ? 0 : round(direction / 90)
#macro cardinal_8dir (round(direction / 45) > 7) ? 0 : round(direction / 45)
#macro cardinal_16dir (round(direction / 22.5) > 15) ? 0 : round(direction / 22.5)
#macro cardinal_32dir (round(direction / 11.25) > 31) ? 0 : round(direction / 11.25)