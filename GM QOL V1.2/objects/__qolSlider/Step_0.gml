/// @desc Selection control
if (mouse_check_button_pressed(mb_left)) {
	var __nubX = x + sprite_width * __value;
	var __nubY = y;
	var __nubRadius = sprite_get_width(__nubSprite) / 2;
	
	if (point_in_circle(mouse_x, mouse_y, __nubX, __nubY, __nubRadius)) __selected = true;
}

if (!mouse_check_button(mb_left)) __selected = false;

if (__selected) {
	__value = clamp((mouse_x - x) / sprite_width, 0, __maxValue);
	
	__sliderFunction();
}