// Increment the spawn timer
spawn_timer += 1;

// Check if it's time to spawn NPCs
if (spawn_timer >= spawn_interval) {
    spawn_timer = 0; // Reset the timer

    // Check if there are fewer NPCs than the maximum allowed
    if (instance_number(obj_npc) < max_npcs) {
        var spawn_x, spawn_y;
        var valid_position = false;

        while (!valid_position) {
            // Generate random position inside the defined boundaries
            spawn_x = irandom_range(128, 1152); // X boundary
            spawn_y = irandom_range(128, 711);  // Y boundary

            // Check if the position is valid (empty and not overlapping other objects)
            if (place_empty(spawn_x, spawn_y) &&
                !instance_position(spawn_x, spawn_y, obj_powerup_parent) &&
                !instance_position(spawn_x, spawn_y, obj_wall)) {
                valid_position = true; // Found a valid spot
            }
        }

        // Spawn the NPC at the valid position
        instance_create_layer(spawn_x, spawn_y, "Instances", obj_npc);
    }
}