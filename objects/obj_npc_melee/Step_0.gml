// Skip logic if the player doesn't exist
if (!instance_exists(obj_player)) {
    exit;
}

// Reference the player instance
var player_instance = instance_nearest(x, y, obj_player);

// Calculate distance to the player
var dist_to_player = point_distance(x, y, player_instance.x, player_instance.y);

// Rotate to face the player
var angle_to_player = point_direction(x, y, player_instance.x, player_instance.y);
image_angle = angle_to_player;

// Movement: Chase the player if outside attack range
if (dist_to_player > attack_range) {
    x += lengthdir_x(speed, angle_to_player);
    y += lengthdir_y(speed, angle_to_player);
} else if (!is_attacking && attack_timer <= 0) {
    // Trigger the attack if within range and cooldown is ready
    is_attacking = true;
    attack_timer_active = true;
    attack_timer = attack_duration;
}

// Attack cooldown logic
if (is_attacking) {
    attack_timer -= 1; // Countdown for the attack animation
    if (attack_timer <= 0) {
        is_attacking = false; // Attack animation ends
        attack_timer = attack_cooldown; // Set the cooldown
        attack_timer_active = false; // Reset flag
    }
}

// Cooldown timer
if (!attack_timer_active && attack_timer > 0) {
    attack_timer -= 1; // Decrease the cooldown timer
}