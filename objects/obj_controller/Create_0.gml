// Game-wide variables
global.score = 0;
global.timer = 10 * game_get_speed(gamespeed_fps); // Optional: game-wide timer (if needed)
game_active = true; // Tracks if the game is paused
level = 1; // Level tracking
global.game_paused = false;
global.freeze_bomb_count = 0; // Start with 0 freeze bombs
global.magnet_active = false; // Magnet effect is not active initially
global.magnet_duration = 0;   // Duration of the magnet effect (in frames)
global.speed_boost_active = false; // Speed boost effect is initially inactive
global.speed_boost_duration = 0;   // Duration of the speed boost effect (in frames)


// Explosion timer
explosion_triggered = false;       // Explosion not triggered yet
explosion_timer = 20 * game_get_speed(gamespeed_fps); // 30 seconds countdown
