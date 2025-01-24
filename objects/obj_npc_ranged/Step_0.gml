// Skip movement if player does not exist
if (!instance_exists(player_instance)) {
    exit;
}

// Calculate distance to the player
var dist_to_player = point_distance(x, y, player_instance.x, player_instance.y);

// Movement logic: Move away from the player if too close, otherwise wander
if (dist_to_player < range) {
    // Move away from the player
    var angle_to_player = point_direction(x, y, player_instance.x, player_instance.y);
    x -= lengthdir_x(speed, angle_to_player);
    y -= lengthdir_y(speed, angle_to_player);
} else {
    // Wander randomly
    var random_dir = irandom_range(0, 3);
    if (random_dir == 0) x += 1; // Move right
    else if (random_dir == 1) x -= 1; // Move left
    else if (random_dir == 2) y += 1; // Move down
    else y -= 1; // Move up
}

// Ranged attack logic
if (dist_to_player <= range && attack_timer <= 0) {
    // Spawn the projectile
    var projectile = instance_create_layer(x, y, "Instances", obj_enemy_projectile);
    projectile.target_x = player_instance.x; // Set player's position as target
    projectile.target_y = player_instance.y;

    attack_timer = attack_cooldown; // Reset the attack timer
}

// Decrease the attack timer
if (attack_timer > 0) {
    attack_timer -= 1;
}