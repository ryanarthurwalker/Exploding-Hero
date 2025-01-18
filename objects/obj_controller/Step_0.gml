// Pause/Resume game
if (keyboard_check_pressed(vk_space)) {
    game_active = !game_active; // Toggle pause
}
if (!game_active) exit; // Pause game logic

// Decrease explosion timer
if (explosion_timer > 0) {
    explosion_timer -= 1; // Count down
} else if (!explosion_triggered) {
    // Trigger the explosion
    instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_explosion);
    explosion_triggered = true;
    show_debug_message("Explosion triggered!");
}

// Check for game over condition
if (!instance_exists(obj_player)) {
    game_active = false;
    show_debug_message("Game Over!");
}

// Restart game
if (keyboard_check_pressed(vk_delete)) {
    game_restart();
}

// Example level logic: Proceed to next level if all NPCs are destroyed
if (instance_number(obj_npc) == 0) {
    level += 1;
    show_debug_message("Level Up! Level: " + string(level));
}