// Game-wide variables
global.score = 0;
global.timer = 60 * room_speed; // Optional: game-wide timer (if needed)
game_active = true; // Tracks if the game is paused
level = 1; // Level tracking

// Explosion timer
explosion_timer = 30 * room_speed; // 30 seconds countdown
explosion_triggered = false;       // Explosion not triggered yet