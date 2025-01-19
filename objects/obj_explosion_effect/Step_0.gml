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

// Destroy objects within the explosion radius
var radius = (image_xscale * sprite_width) / 2; // Calculate current radius

with (obj_npc) {
    if (point_distance(x, y, other.x, other.y) <= radius) {
        instance_destroy(); // Destroy the NPC
        global.score += 100; // Increment score
        show_debug_message("NPC destroyed! Score: " + string(global.score));
    }
}

if (instance_exists(obj_player)) {
    if (point_distance(x, y, obj_player.x, obj_player.y) <= radius) {
        instance_destroy(obj_player); // Destroy the player
        show_debug_message("Player destroyed by explosion!");
    }
}