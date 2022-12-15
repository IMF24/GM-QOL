/// @desc Enable box typing
with (object_index) {
	if (self.id != other.id) && (__inputEnabled) {
		__inputEnabled = false;
		image_index = __inputEnabled;
	}
}
__inputEnabled = !__inputEnabled;