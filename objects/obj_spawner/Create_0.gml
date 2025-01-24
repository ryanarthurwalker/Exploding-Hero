max_npcs = 10; // Total number of NPCs to spawn
spawn_timer = 0;
spawn_interval = 1000;

// Define the spawn area boundaries
spawn_min_x = 128;  // Left boundary
spawn_max_x = 1152; // Right boundary
spawn_min_y = 128;  // Top boundary
spawn_max_y = 711;  // Bottom boundary

// Spawn the NPCs at valid positions
for (var i = 0; i < max_npcs; i++) {
    var spawn_x, spawn_y;
    var valid_position = false;

    while (!valid_position) {
        // Generate a random position within the spawn area
        spawn_x = random_range(spawn_min_x, spawn_max_x);
        spawn_y = random_range(spawn_min_y, spawn_max_y);

        // Ensure the position is empty and not overlapping powerups or walls
        if (place_empty(spawn_x, spawn_y) && 
            !instance_position(spawn_x, spawn_y, obj_powerup_parent) && 
            !instance_position(spawn_x, spawn_y, obj_wall)) {
            valid_position = true; // Found a valid position
        }
    }

    // Create the NPC at the valid position
    instance_create_layer(spawn_x, spawn_y, "Instances", obj_npc);
}