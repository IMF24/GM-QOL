/// @desc Main fade control
// Fade OUT state.
if (__state == 0) {
	// Increase timer by 1 every frame.
	__timer++;
	
	// Change room when timer is greater than duration.
	if (__timer > __duration) {
		// Change rooms.
		room_goto(__targetRoom);
		
		// Change fade state.
		__state = 1;
	}
	
// Fade IN state.
} else if (__state == 1) {
	// If a delay was set, wait for that first before fading in.
	if (__delay > 0) __delay--; else {
	
		// Decrease timer by 1 every frame.
		__timer--;
	
		// Destroy fade object when finished.
		if (__timer <= 0) instance_destroy();
		
	}
}

// Set fade alpha.
__alpha = __timer / __duration;