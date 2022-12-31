/// @desc Draw slider nub and fill
draw_self();
draw_sprite_part_ext(sprite_index, 1, 0, 0, sprite_width * __value, sprite_height, x, y - sprite_get_yoffset(sprite_index), __barXScale, __barYScale, __barFillColor, __barAlpha);
draw_sprite_ext(__qolSliderNub, 0, x + sprite_width * __value, y, __nubXScale, __nubYScale, __nubAngle, __nubColor, __nubAlpha);