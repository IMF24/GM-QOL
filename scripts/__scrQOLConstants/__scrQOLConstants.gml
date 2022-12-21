// QUALITY OF LIFE FUNCTIONS SCRIPT BY IMF24, ET AL.
// GM QOL CONSTANTS

// QOL current version.
#macro QOL_VERSION "1.1"

// Debug log global variable.
global.__debugLog = [];

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