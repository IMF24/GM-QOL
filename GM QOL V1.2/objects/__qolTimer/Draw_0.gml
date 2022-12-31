/// @desc Draw the timer (GUI Draw)
if (__drawMode != 0) exit;

var __minsStr = str(__mins);
var __secsStr = str(__secs);
var __timerStr = __minsStr + ":" + string_repeat("0", 2 - string_length(__secsStr)) + __secsStr;
draw_text_base(__drawX, __drawY, __timerStr, __drawAlpha, __drawColor, __drawFont, __drawHAlign, __drawVAlign);