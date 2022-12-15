/// @desc Initialize cross fade variables
// Cross fade properties.
__duration = 60;

// Control variables.
__timer = 0;
__alpha = 0;

// Make a copy of the application surface.
__surfWidth = surface_get_width(application_surface);
__surfHeight = surface_get_height(application_surface);
__surf = surface_create(__surfWidth, __surfHeight);

surface_copy(__surf, 0, 0, application_surface);