// Handle the key press for restarting the game
if (keyboard_check_pressed(ord("R"))) {
    room_goto(room_game);  // Restart the game by going to the game room (replace 'room_game' with your actual game room name)
}

// Handle the key press for quitting the game
if (keyboard_check_pressed(ord("Q"))) {
    game_end();  // Quit the game
}