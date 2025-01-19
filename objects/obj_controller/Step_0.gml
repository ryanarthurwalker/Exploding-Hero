// Skip game logic if paused
if (global.game_paused) {
    exit; // Exit the Step Event early
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


// Level Progression
if (instance_number(obj_npc) == 0) { // All NPCs destroyed
    level += 1;
    show_debug_message("Level Up! Now on Level: " + string(level));
}

if (random(1000) < 10) { 
    var bomb_x = irandom_range(50, room_width - 50);
    var bomb_y = irandom_range(50, room_height - 50);
    instance_create_layer(bomb_x, bomb_y, "Instances", obj_freeze_bomb);
}