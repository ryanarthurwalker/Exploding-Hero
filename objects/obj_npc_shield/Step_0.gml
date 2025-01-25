// Skip behavior if game is paused
if (global.game_paused) {
    exit;
}

// Define the spawn area boundaries
spawn_min_x = 128;  // Left boundary
spawn_max_x = 1152; // Right boundary
spawn_min_y = 128;  // Top boundary
spawn_max_y = 711;  // Bottom boundary


// Ensure the NPC stays within the defined boundaries
if (x < spawn_min_x) {
    x = spawn_min_x; // Clamp to left boundary
} else if (x > spawn_max_x) {
    x = spawn_max_x; // Clamp to right boundary
}

if (y < spawn_min_y) {
    y = spawn_min_y; // Clamp to top boundary
} else if (y > spawn_max_y) {
    y = spawn_max_y; // Clamp to bottom boundary
}

// Reverse direction if hitting boundaries
if (x <= spawn_min_x || x >= spawn_max_x) {
    hspeed = -hspeed;
}
if (y <= spawn_min_y || y >= spawn_max_y) {
    vspeed = -vspeed;
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