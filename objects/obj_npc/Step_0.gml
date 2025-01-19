if (global.game_paused) {
    exit; // Skip NPC movement while paused
}

// Handle freeze state
if (frozen) {
    speed = 0; // Stop movement
    freeze_timer -= 1; // Countdown the freeze timer

    // Unfreeze when the timer reaches 0
    if (freeze_timer <= 0) {
        frozen = false; // Exit freeze state
        speed = original_speed; // Restore speed
    }
}

// Normal NPC movement logic if not frozen
if (!frozen) {
    if (escape_mode) {
    // Move toward the escape target
    var angle_to_target = point_direction(x, y, escape_target_x, escape_target_y);
    x += lengthdir_x(escape_speed, angle_to_target);
    y += lengthdir_y(escape_speed, angle_to_target);

    // Check if the NPC has reached the escape target
    if (point_distance(x, y, escape_target_x, escape_target_y) < 2) {
        escape_mode = false; // Stop escaping
    }
    return; // Skip other behaviors while escaping
}

if (instance_exists(obj_player)) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);

    if (dist < 100) {
        // Flee from the player
        var npc_angle = point_direction(x, y, obj_player.x, obj_player.y);
        var npc_speed = 1; // Adjust fleeing speed
        x -= lengthdir_x(npc_speed, npc_angle);
        y -= lengthdir_y(npc_speed, npc_angle);
    } else {
        // Wander randomly
        x += irandom_range(-1, 1); // Small random movement
        y += irandom_range(-1, 1);
    }
} else {
    // Wander randomly when no player exists
    x += irandom_range(-1, 1);
    y += irandom_range(-1, 1);
}
}

if (frozen) {
    image_blend = c_blue; // Change color to blue
} else {
    image_blend = c_white; // Reset color
}



