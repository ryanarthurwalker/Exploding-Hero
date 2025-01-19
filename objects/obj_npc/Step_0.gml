// Skip NPC movement if the game is paused
if (global.game_paused) {
    exit; // Skip everything if the game is paused
}

// Handle freeze state (already set in collision event)
if (frozen) {
    // Countdown the freeze timer
    freeze_timer -= 1 * game_get_speed(gamespeed_fps); // Decrease freeze timer frame-by-frame

    // If the freeze timer runs out, unfreeze the NPC
    if (freeze_timer <= 0) {
        frozen = false;  // NPC is unfrozen
        speed = original_speed;  // Restore original speed
        image_blend = c_white;  // Reset color to normal
        escape_mode = false; // Stop escape mode when unfrozen
    }

    // Stop NPC movement while frozen
    speed = 0;  // Prevent movement
    escape_mode = false; // Prevent escape mode when frozen

    // Visual feedback: Change color to blue to indicate freezing
    image_blend = c_blue;

} else { // If not frozen, proceed with normal movement logic
    // NPC behavior when player exists
    if (instance_exists(obj_player)) {
        var dist = point_distance(x, y, obj_player.x, obj_player.y);

        if (dist < 100) {
            // Flee from the player
            var npc_angle = point_direction(x, y, obj_player.x, obj_player.y);
            var npc_speed = 2 + (100 - dist) / 10;  // Speed increases as NPC gets closer
            x -= lengthdir_x(npc_speed, npc_angle);  // Move away from the player
            y -= lengthdir_y(npc_speed, npc_angle);  // Move away from the player
        } else {
            // Wander randomly when the player is not close
            var random_direction = irandom_range(0, 3);
            if (random_direction == 0) {
                x += 1;  // Move right
            } else if (random_direction == 1) {
                x -= 1;  // Move left
            } else if (random_direction == 2) {
                y += 1;  // Move down
            } else {
                y -= 1;  // Move up
            }
        }
    } else {
        // Wander randomly when no player exists
        var random_direction = irandom_range(0, 3);
        if (random_direction == 0) {
            x += 1;  // Move right
        } else if (random_direction == 1) {
            x -= 1;  // Move left
        } else if (random_direction == 2) {
            y += 1;  // Move down
        } else {
            y -= 1;  // Move up
        }
    }
}

// Freezing visual effect (if frozen, NPC should appear blue)
if (frozen) {
    image_blend = c_blue; // Change color to blue to indicate frozen state
} else {
    image_blend = c_white; // Reset color when unfrozen
}