// Initialize direction and speed
direction = 0; // Starting direction
speed = 2; // Default speed of the projectile

// Scaling properties
image_xscale = .2;
image_yscale = .2;


// Heat-seeking properties
heat_seeking_strength = 2; // Lower values = stronger heat-seeking

// Distance tracking
distance_traveled = 0; // Tracks how far the projectile has moved
distance_traveled_initialized = false; // Flag to initialize distance tracking
start_x = x; // Starting position
start_y = y;