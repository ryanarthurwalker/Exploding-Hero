// Activate the magnet effect
global.magnet_active = true; // Set magnet effect as active
global.magnet_duration = 5 * game_get_speed(gamespeed_fps); // Set duration for 5 seconds (adjust if needed)

// Optionally, display a debug message to verify
show_debug_message("Magnet effect activated!");

// Destroy the magnet object after it's collected
instance_destroy();