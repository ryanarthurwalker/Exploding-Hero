image_xscale = .2
image_yscale = .2

// Movement settings
original_speed = 0; // Default movement speed
speed = original_speed; // Current speed
range = 200; // Distance to start attacking the player
attack_cooldown = 300; // Cooldown between attacks (in frames)
freeze_timer = 0;  // Freeze timer (e.g., 5 seconds)
freeze_timer_initialized = false; 
attack_timer = 0

// Targeting the player
player_instance = obj_player; // Reference to the player object