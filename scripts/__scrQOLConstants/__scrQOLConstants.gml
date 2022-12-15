// QUALITY OF LIFE FUNCTIONS SCRIPT BY IMF24, ET AL.
// GM QOL CONSTANTS

// QOL current version.
#macro QOL_VERSION "1.0"

// Debug log global variable.
global.__debugLog = [];

// Color constants.
#macro c_plum #CC00FF
#macro c_midnight #002060
#macro c_blgray #292D3E

// Dark overlay types.
#macro ov_part 0
#macro ov_full 1

// Easy constants for using draw_sprite_part() or the draw_bar_*() functions.
#macro anim -1
#macro noanim 0

// The set frame rate of the game.
#macro game_fps game_get_speed(gamespeed_fps)

// Check, pressed, and released constants.
#macro check 0
#macro pressed 1
#macro released 2

// Macros for either the sprite itself or its collision mask.
#macro sprite 0
#macro frame 1
#macro mask 2


// Macros for determining cursor type.
#macro cr_normal 0
#macro cr_sprite 1