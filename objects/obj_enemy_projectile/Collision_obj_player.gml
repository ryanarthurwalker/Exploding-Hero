// Deduct health from the player
global.health -= 10; // Adjust damage amount as needed

// Check if the player's health is zero or below
if (global.health <= 0) {
    // Destroy the player object (or trigger a game over screen)
    instance_destroy(obj_player); 
    show_message("Game Over!"); // Display a game-over message (optional)
}

// Destroy the projectile
instance_destroy();