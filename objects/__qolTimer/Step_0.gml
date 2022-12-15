/// @desc Timer control script
// If at 0:00, stop timer.
if (__mins <= 0) && (__secs <= 0) {
	if (!__eventRun) __event();
	if (!__loopEvent) __eventRun = true;
	exit;
}

// Deduct ms by 1 every frame.
__ms--;

// Deduct seconds.
if (__ms <= 0) {
	__ms = __msFPS;
	__secs--;
}

// Minute deduction.
if (__secs <= -1) {
	__mins--;
	__secs = 59;
}

// Minute overflow handler.
if (__secs >= 60) {
	__mins++;
	__secs -= 60;
}