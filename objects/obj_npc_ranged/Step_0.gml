// Check if the player exists
if (!instance_exists(obj_player)) {
    exit; // No player to interact with
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

// Reference the nearest player instance
var player_instance = instance_nearest(x, y, obj_player);

// Calculate the distance and direction to the player
var dist_to_player = point_distance(x, y, player_instance.x, player_instance.y);
var angle_to_player = point_direction(x, y, player_instance.x, player_instance.y);

// Movement logic: Move away from the player if too close, otherwise wander
if (dist_to_player < range) {
    // Move away from the player
    var npc_speed = 3; // Speed of the NPC when moving away
    x -= lengthdir_x(npc_speed, angle_to_player); // Move in the opposite direction
    y -= lengthdir_y(npc_speed, angle_to_player); // Move in the opposite direction
} else {
    // Wander randomly when the player is not close
    if (irandom(200) < 2) { // Adjust chance of changing direction
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

// Ranged attack logic
if (dist_to_player <= range && attack_timer <= 0) {
    // Spawn the projectile
    var projectile = instance_create_layer(x, y, "Instances", obj_enemy_projectile);
    projectile.target_x = player_instance.x; // Set the player's position as target
    projectile.target_y = player_instance.y;

    // Reset the attack timer
    attack_timer = attack_cooldown;
}

// Decrease the attack timer
if (attack_timer > 0) {
    attack_timer -= 1;
}