/// @desc Initialize button variables
sprite_index = -1;
__buttonType = frame;
__up = 0;
__over = 1;
__okFunction = function () {}
__spriteCheckType = sprite;
__cursorType = cr_normal;
__cursorList = [cr_arrow, cr_handpoint];
__cursorListDefault = [cr_arrow, cursor_sprite];
__okInput = mb_left;
__inputType = released;
image_alpha = 1;
image_blend = c_white;
image_angle = 0;
x = 0;
y = 0;
depth = 0;

__buttonText = "";
__textAlpha = QOL_DEFAULT_ALPHA;
__textColor = QOL_DEFAULT_TEXT_COLOR;
__textFont = QOL_DEFAULT_FONT;
__textHAlign = QOL_DEFAULT_HALIGN;
__textVAlign = QOL_DEFAULT_VALIGN;

