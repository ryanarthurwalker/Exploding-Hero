max_npcs = 100; // Total number of NPCs to spawn
spawn_timer = 0;
spawn_interval = 30;

// Spawn the NPCs
for (var i = 0; i < max_npcs; i++) {
    var spawn_x, spawn_y;
    var valid_position = false;

    while (!valid_position) {
        // Generate random position
        spawn_x = random_range(50, room_width - 50);
		spawn_y = random_range(50, room_height - 50);

        // Ensure the position is empty and not overlapping powerups
        if (place_empty(spawn_x, spawn_y) && !instance_position(spawn_x, spawn_y, obj_speed_boost)) {
            valid_position = true; // Found a valid position
        }
    }

    // Create the NPC at the valid position
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_npc);
}