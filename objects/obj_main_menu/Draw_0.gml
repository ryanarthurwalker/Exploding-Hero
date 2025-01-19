// Step 1: Centering the menu on the room center

// Calculate the center of the room
var center_x = room_width / 2;
var center_y = room_height / 2;

// Set the y-offset to create space for the title
var y_offset = -50; // Adjust this value to change the vertical position of the menu

// Set the default font for the title
draw_set_font(fnt_default);

// Draw the main menu title at the center (horizontal) and at a vertical offset
draw_text(center_x - string_width("Main Menu") / 2, center_y + y_offset, "Main Menu");

// Draw the options
if (menu_option == 0) {
    // Highlight "Start Game" with bold and larger font
    draw_set_font(fnt_bold);
    draw_text(center_x - string_width("Start Game (Selected)") / 2, center_y + 50, "Start Game (Selected)");
    draw_set_font(fnt_default); // Reset to default font
} else {
    draw_text(center_x - string_width("Start Game") / 2, center_y + 50, "Start Game");
}

if (menu_option == 1) {
    // Highlight "Quit" with bold and larger font
    draw_set_font(fnt_bold);
    draw_text(center_x - string_width("Quit (Selected)") / 2, center_y + 80, "Quit (Selected)");
    draw_set_font(fnt_default); // Reset to default font
} else {
    draw_text(center_x - string_width("Quit") / 2, center_y + 80, "Quit");
}

// Add the "How to Play" section below the menu options
draw_set_font(fnt_default); // Use default font for this section
draw_text(center_x - string_width("How to Play") / 2, center_y + 150, "How to Play:");
draw_text(center_x - string_width("Use arrow keys to move") / 2, center_y + 180, "Use arrow keys to move");
draw_text(center_x - string_width("Press space to interact") / 2, center_y + 210, "Press space to interact");
draw_text(center_x - string_width("Avoid enemies and obstacles") / 2, center_y + 240, "Avoid enemies and obstacles");