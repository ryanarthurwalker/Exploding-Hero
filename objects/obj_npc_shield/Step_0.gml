// Skip behavior if game is paused
if (global.game_paused) {
    exit;
}

// Ensure the sprite remains upright (no rotation)
image_angle = 0;

// Calculate the distance to the player
if (instance_exists(obj_player)) {
    var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    // Check if the player is within 200 pixels
    if (dist_to_player <= 200) {
        // Shielded mode: Apply visual effect and make invulnerable
        if (!shield_active) {
            shield_active = true;

            // Add glow effect (example using image_blend)
            image_blend = c_aqua; // Change to a glowing color
        }

        // Slowly move away from the player
        var move_speed = 1; // Adjust for slower movement
        var angle_to_player = point_direction(x, y, obj_player.x, obj_player.y);
        x -= lengthdir_x(move_speed, angle_to_player);
        y -= lengthdir_y(move_speed, angle_to_player);
    } else {
        // Not shielded: Reset visual effects and movement
        if (shield_active) {
            shield_active = false;

            // Remove glow effect
            image_blend = c_white; // Reset to normal color
        }
    }
}