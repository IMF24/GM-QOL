/// @desc Cross fade handler
// Add to timer.
__timer++;

// If the timer is at or above the duration. End the fade if it is.
if (__timer >= __duration) {
	if (surface_exists(__surf)) surface_free(__surf);
	
	instance_destroy();
}

// Set cross fade alpha.
__alpha = 1 - (__timer / __duration);