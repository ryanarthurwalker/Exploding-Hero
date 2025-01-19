// Initialize the explosion's properties
explosion_radius = 1;  // Start with a radius of 0
growth_rate = 1.0;     // How fast the explosion grows
max_radius = 50;      // Max size of the explosion



// Set lifetime (5 seconds converted to frames)
lifetime = 5 * game_get_speed(gamespeed_fps);  // Lifetime in frames based on FPS