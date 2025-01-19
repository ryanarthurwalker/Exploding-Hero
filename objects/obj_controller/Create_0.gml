// Game-wide variables
global.score = 0;
global.timer = 10 * game_get_speed(gamespeed_fps); // Optional: game-wide timer (if needed)
game_active = true; // Tracks if the game is paused
level = 1; // Level tracking

// Explosion timer
explosion_triggered = false;       // Explosion not triggered yet
explosion_timer = 5 * game_get_speed(gamespeed_fps); // 30 seconds countdown
