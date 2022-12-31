/// @desc Initialize timer variables
// Timer flow variables.
__mins = 1;
__secs = 30;
__msFPS = game_get_speed(gamespeed_fps);
__ms = __msFPS;
__event = function () {}
__loopEvent = false;
__eventRun = false;

// Timer drawing variables.
__drawAlpha = QOL_DEFAULT_ALPHA;
__drawColor = QOL_DEFAULT_TEXT_COLOR;
__drawFont = QOL_DEFAULT_FONT;
__drawHAlign = QOL_DEFAULT_HALIGN;
__drawVAlign = QOL_DEFAULT_VALIGN;
__drawX = room_width / 2;
__drawY = room_height / 2;
__drawMode = 0;				// 0 - Normal Draw, 1 - GUI Draw