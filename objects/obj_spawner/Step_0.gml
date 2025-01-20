// Increment the spawn timer
spawn_timer += 1;

// Check if it's time to attempt spawning NPCs
if (spawn_timer >= spawn_interval) {
    spawn_timer = 0; // Reset the timer

    // Check if there are fewer NPCs than the maximum allowed
    if (instance_number(obj_npc) < max_npcs) {
        var spawn_x, spawn_y;
        var valid_position = false;

        while (!valid_position) {
            // Generate random spawn position
            spawn_x = random(room_width);
            spawn_y = random(room_height);

            // Ensure the position is empty and not overlapping powerups
            if (place_empty(spawn_x, spawn_y) && !instance_position(spawn_x, spawn_y, obj_powerup_parent)) {
    valid_position = true; // Found a valid position
}
        }

        // Spawn the NPC at the valid position
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_npc);
    }
}