/// @desc Draw text on the button (if defined)
// Draw button sprite.
if (sprite_index != -1) draw_self();

// Draw the text (if declared).
draw_text_base(x, y, __buttonText, __textAlpha, __textColor, __textFont, __textHAlign, __textVAlign);

