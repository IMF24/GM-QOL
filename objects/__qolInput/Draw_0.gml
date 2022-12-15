/// @desc Draw the text in the box
// Make self visible.
draw_self();

// If no string exists, show the hint text.
if (__text == "") draw_text_base(x, y, __hintText, __textAlpha, #808080, __textFont, __textHAlign, __textVAlign);

// Draw the text and set its draw properties.
draw_text_base(x, y, __text, __textAlpha, __textColor, __textFont, __textHAlign, __textVAlign);