// Activate the speed boost effect
global.speed_boost_active = true; // Set speed boost effect as active
global.speed_boost_duration = 5 * game_get_speed(gamespeed_fps); // Set duration for 5 seconds (adjust as needed)

// Optionally, show a debug message to confirm activation
show_debug_message("Speed Boost activated!");

// Destroy the speed boost item after it is collected
instance_destroy();