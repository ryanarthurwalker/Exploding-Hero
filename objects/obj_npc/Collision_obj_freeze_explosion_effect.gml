// Check if the NPC is already frozen; if not, apply the freeze effect
if (!frozen) {
    // Set the freeze state
    frozen = true;  // NPC is now frozen
    speed = 0;  // Stop the NPC from moving

    // Set the freeze timer to 5 seconds (or the desired freeze duration)
    freeze_timer = 5 * game_get_speed(gamespeed_fps); // Use game speed to keep it time-independent

    // Change color to indicate freezing (cyan for frozen state)
    image_blend = c_blue;

    // Optionally, you can add additional effects, like sound or visual feedback.
    show_debug_message("NPC frozen for " + string(freeze_timer) + " frames.");
}

// The NPC will remain frozen for the duration of the freeze_timer and won't move