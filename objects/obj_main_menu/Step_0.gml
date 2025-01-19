// Change selected option based on keyboard input
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

// Start the game or quit based on the selected option
if (keyboard_check_pressed(vk_enter)) {
    if (menu_option == 0) {
        // Start the game
        room_goto(Room1);  // Assuming your game room is called "room_game"
    } else if (menu_option == 1) {
        game_end();  // Quit the game
    }
}