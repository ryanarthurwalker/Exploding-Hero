// Rotate the arrow to match its direction
image_angle = direction; // Set the sprite's angle to match the arrow's direction
image_xscale = 0.2;      // Optional: Scale the sprite size if needed
image_yscale = 0.2;      // Optional: Scale the sprite size if needed

// Arrow properties
image_angle = direction; // Make the arrow face the correct direction
deceleration = 0.17;      // How quickly the arrow slows down
min_speed = 2;           // The lowest speed before the arrow stops completely

// Distance tracking
distance_traveled = 0;   // Total distance the arrow has traveled
max_distance = 200;      // Maximum distance the arrow can travel