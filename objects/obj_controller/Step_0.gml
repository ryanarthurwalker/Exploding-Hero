// Skip game logic if paused
if (global.game_paused) {
    exit; // Exit the Step Event early
}

if (global.score >= enemies_to_kill) {
    level_complete = true;  // Mark level as complete
    objective_complete = true;  // Mark the objective as complete
}

// Explosion Timer Logic
if (explosion_timer > 0) {
    explosion_timer -= 1; // Countdown
} else if (!explosion_triggered) {
    // Trigger the explosion at the player's location
    if (instance_exists(obj_player)) {
        var player_x = obj_player.x;
        var player_y = obj_player.y;
        instance_create_layer(player_x, player_y, "Instances", obj_explosion_effect);
    } else {
        // Fallback if player does not exist
        var fallback_x = room_width / 2;
        var fallback_y = room_height / 2;
        instance_create_layer(fallback_x, fallback_y, "Instances", obj_explosion_effect);
    }
    explosion_triggered = true; // Prevent multiple explosions
    show_debug_message("Explosion triggered!");
}

// Check for Game Over
if (!instance_exists(obj_player)) {
    game_active = false;
    show_debug_message("Game Over!");
}

// Level Objective Logic
switch (current_level) {
    case 1:
        enemies_to_kill = 10;  // Kill 10 enemies
        break;
    case 2:
        enemies_to_kill = 15;  // Kill 15 enemies
        break;
    case 3:
        enemies_to_kill = 20;  // Kill 20 enemies
        break;
    // Add cases for other levels as needed
}

// Freeze gameplay when level is complete
if (level_complete) {
    // Display a completion message
    draw_text(room_width / 2 - string_width("Level Complete!") / 2, room_height / 2, "Level Complete!");
    draw_text(room_width / 2 - string_width("Press Enter to Continue") / 2, room_height / 2 + 50, "Press Enter to Continue");
    
    // Wait for player input to continue
    if (keyboard_check_pressed(vk_enter)) {
        // Transition to the next level
        if (room_exists(room_next(room))) {
            room_goto_next();  // Go to the next room
        } else {
            show_message("You've completed the game!");  // End-of-game message
            game_restart();  // Restart the game
        }
    }
    exit; // Stop further Step logic
}

// Objective Completion Check
if (!objective_complete && enemies_killed >= enemies_to_kill) {
    objective_complete = true;  // Mark the objective as complete
    show_debug_message("Objective Complete!");
    level_complete = true;  // Mark the level as complete
}

// Optional: Draw level information and progress
draw_text(10, 10, "Level: " + string(current_level));
draw_text(10, 30, "Enemies Killed: " + string(enemies_killed) + "/" + string(enemies_to_kill));