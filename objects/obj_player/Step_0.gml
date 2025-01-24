// Horizontal movement
if (keyboard_check(vk_right)) {
    hspeed += acceleration; // Accelerate to the right
} else if (keyboard_check(vk_left)) {
    hspeed -= acceleration; // Accelerate to the left
} else {
    // Decelerate horizontally if no keys are pressed
    if (abs(hspeed) > deceleration) {
        hspeed -= sign(hspeed) * deceleration;
    } else {
        hspeed = 0; // Stop completely when very slow
    }
}

// Vertical movement
if (keyboard_check(vk_up)) {
    vspeed -= acceleration; // Accelerate upward
} else if (keyboard_check(vk_down)) {
    vspeed += acceleration; // Accelerate downward
} else {
    // Decelerate vertically if no keys are pressed
    if (abs(vspeed) > deceleration) {
        vspeed -= sign(vspeed) * deceleration;
    } else {
        vspeed = 0; // Stop completely when very slow
    }
}

// Clamp the speed to the maximum
hspeed = clamp(hspeed, -max_speed, max_speed);
vspeed = clamp(vspeed, -max_speed, max_speed);

// Apply movement
x += hspeed;
y += vspeed;

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