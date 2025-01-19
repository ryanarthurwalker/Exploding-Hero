if (keyboard_check(vk_left)) x -= player_speed;
if (keyboard_check(vk_right)) x += player_speed;
if (keyboard_check(vk_up)) y -= player_speed;
if (keyboard_check(vk_down)) y += player_speed;

if (keyboard_check(vk_left)) image_angle = 180;
if (keyboard_check(vk_right)) image_angle = 0;
if (keyboard_check(vk_up)) image_angle = 270;
if (keyboard_check(vk_down)) image_angle = 90;

// Adjust this value for weaker or stronger pull
var pull_strength = 2; // Basic pull strength

if (global.magnet_active) {
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