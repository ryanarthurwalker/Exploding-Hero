// Skip logic if the player doesn't exist
if (!instance_exists(obj_player)) {
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


// Get the player's current position dynamically
player_x = obj_player.x;
player_y = obj_player.y;

// Calculate the angle to the player
angle_to_player = point_direction(x, y, player_x, player_y);

// Movement: Always chase the player at a speed of 1
x += lengthdir_x(1, angle_to_player);
y += lengthdir_y(1, angle_to_player);

// Melee attack logic: Check if the player is within attack range
dist_to_player = point_distance(x, y, player_x, player_y);

if (dist_to_player <= attack_range) {
    // Perform the attack (add your attack logic here)
    show_debug_message("Attacking the player!");
}