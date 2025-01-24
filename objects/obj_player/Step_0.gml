// Horizontal and vertical movement (D, A, W, S)
var move_x = 0; // Initialize horizontal movement
var move_y = 0; // Initialize vertical movement

// Detect horizontal input
if (keyboard_check(ord("D"))) {
    move_x += 1; // Move right
}
if (keyboard_check(ord("A"))) {
    move_x -= 1; // Move left
}

// Detect vertical input
if (keyboard_check(ord("W"))) {
    move_y -= 1; // Move up
}
if (keyboard_check(ord("S"))) {
    move_y += 1; // Move down
}

// Normalize movement to ensure consistent speed for diagonal movement
if (move_x != 0 || move_y != 0) {
    var movement_length = sqrt(move_x * move_x + move_y * move_y); // Calculate magnitude
    move_x /= movement_length; // Normalize horizontal movement
    move_y /= movement_length; // Normalize vertical movement
}

// Apply movement speed
hspeed = move_x * max_speed;
vspeed = move_y * max_speed;

// Update position
x += hspeed;
y += vspeed;

// Set `facing_direction` for all directions
if (move_x > 0 && move_y < 0) {
    facing_direction = 45;   // Diagonal Up-Right
} else if (move_x < 0 && move_y < 0) {
    facing_direction = 135;  // Diagonal Up-Left
} else if (move_x < 0 && move_y > 0) {
    facing_direction = 225;  // Diagonal Down-Left
} else if (move_x > 0 && move_y > 0) {
    facing_direction = 315;  // Diagonal Down-Right
} else if (move_x > 0) {
    facing_direction = 0;    // Right
} else if (move_x < 0) {
    facing_direction = 180;  // Left
} else if (move_y < 0) {
    facing_direction = 90;   // Up
} else if (move_y > 0) {
    facing_direction = 270;  // Down
}

// Clamp the speed to the maximum
hspeed = clamp(hspeed, -max_speed, max_speed);
vspeed = clamp(vspeed, -max_speed, max_speed);


// Speed boost effect
if (global.speed_boost_active) {
    move_speed = 6; // Increase movement speed when speed boost is active
}


// Magnet logic (pull NPCs towards player)
if (global.magnet_active) {
    // Adjust this value for weaker or stronger pull
    var pull_strength = 2; // Basic pull strength

    // Pull NPCs towards the player
    with (obj_npc) {
        // Calculate the direction from the NPC to the player
        var direction_to_player = point_direction(x, y, obj_player.x, obj_player.y);

        // Calculate the distance from the player
        var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

        // Apply a damping effect (weaker pull the closer the NPC gets)
        var adjusted_pull = pull_strength * (1 / distance_to_player); // Weaken pull over distance

        // Limit the minimum pull (to avoid division by 0 or infinite pull)
        adjusted_pull = max(adjusted_pull, 0.5); // Minimum pull strength

        // Move the NPC toward the player with the adjusted pull
        x += lengthdir_x(adjusted_pull, direction_to_player); 
        y += lengthdir_y(adjusted_pull, direction_to_player);
    }

    // Decrease the magnet effect duration
    global.magnet_duration -= 1;

    // Deactivate the magnet effect after its duration ends
    if (global.magnet_duration <= 0) {
        global.magnet_active = false;
    }
}

// Speed boost effect logic
if (global.speed_boost_active) {
    // Decrease the speed boost duration
    global.speed_boost_duration -= 1;

    // Deactivate the speed boost after its duration ends
    if (global.speed_boost_duration <= 0) {
        global.speed_boost_active = false; // Deactivate the effect
    }
}