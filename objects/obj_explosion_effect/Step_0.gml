// Countdown the explosion timer
if (explosion_timer > 0) {
    explosion_timer -= 1;
} else {
    instance_destroy(); // Destroy the explosion effect when the timer ends
    return;
}

// Increase the size of the explosion effect
image_xscale += expansion_speed;
image_yscale += expansion_speed;


// Calculate the current explosion radius based on the sprite's scale
var radius = (image_xscale * sprite_width) / 2;

// Check for player destruction
if (instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) <= radius) {
        instance_destroy(obj_player); // Destroy player
        show_debug_message("Player destroyed by explosion!");
    }
}