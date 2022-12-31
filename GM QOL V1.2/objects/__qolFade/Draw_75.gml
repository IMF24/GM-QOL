/// @desc Draw fade over screen
// Get the dimensions of the GUI layer.
var __guiWidth = display_get_gui_width();
var __guiHeight = display_get_gui_height();

// Draw the fade on the screen.
draw_set_alpha(__alpha);
draw_set_color(__color);

draw_rectangle(0, 0, __guiWidth, __guiHeight, 0);

// Reset draw properties.
draw_set_alpha(1);
draw_set_color(c_black);