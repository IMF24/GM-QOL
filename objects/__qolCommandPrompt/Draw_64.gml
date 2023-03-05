/// @desc Draw overlay and text
// Draw window overlay.
draw_overlay(ov_full, c_black, 0.6);
draw_overlay(ov_part, c_black, 0.8, 0, room_height - 24, room_width, room_height);

draw_set_base(1, c_white, __qolCommandFont, fa_left, fa_middle);

if (__text != "") draw_text_base(x, y, "/" + __text, 1, c_white, __qolCommandFont, fa_left, fa_middle);
else draw_text_base(x, y, "/" + __hintTextListen, 1, c_gray, __qolCommandFont, fa_left, fa_middle);

draw_text_base(x, y - 24, __cmdOutputLog, 1, c_white, __qolCommandFont, fa_left, fa_bottom);