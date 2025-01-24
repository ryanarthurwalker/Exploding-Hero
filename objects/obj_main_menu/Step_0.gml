// Change selected option based on keyboard input
if (!fading_out) {
    if (keyboard_check_pressed(vk_up)) {
        menu_option -= 1;
        if (menu_option < 0) {
            menu_option = 1; // Loop back to the last option
        }
    }

    if (keyboard_check_pressed(vk_down)) {
        menu_option += 1;
        if (menu_option > 1) {
            menu_option = 0; // Loop back to the first option
        }
    }

    // Start fade-out and countdown when Start Game is selected
    if (menu_option == 0 && keyboard_check_pressed(vk_enter)) {
        fading_out = true;  // Start fade-out effect
    }

    // Quit game when Quit is selected
    if (menu_option == 1 && keyboard_check_pressed(vk_enter)) {
        game_end();
    }
}

// Handle the fade-out effect
if (fading_out) {
    fade_opacity += fade_speed;  // Increase the fade opacity
    if (fade_opacity >= 1) {
        // Fully faded out, transition to the next room
        room_goto_next();  // Replace 'Room1' with the correct name of your game room
    }
}