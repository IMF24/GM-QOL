/// @desc Draw the copied surface
// Draw copied surface if it exists.
if (surface_exists(__surf)) {
	// Get the dimensions of the GUI layer.
	var __guiWidth = display_get_gui_width();
	var __guiHeight = display_get_gui_height();
	
	// We'll stretch the surface to fit on the GUI layer.
	draw_surface_stretched_ext(__surf, 0, 0, __guiWidth, __guiHeight, c_white, __alpha);
}