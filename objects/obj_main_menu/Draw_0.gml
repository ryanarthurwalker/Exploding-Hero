

// Draw the menu text
var center_x = room_width / 2;
var center_y = room_height / 2;
var y_offset = -50;

// Main Menu Title
draw_set_font(fnt_default);
draw_text(center_x - string_width("Main Menu") / 2, center_y + y_offset, "Main Menu");

// Start Game Option
if (menu_option == 0) {
    draw_set_font(fnt_bold);
    draw_text(center_x - string_width("Start Game") / 2, center_y + 100, "Start Game");
    draw_set_font(fnt_default);
} else {
    draw_text(center_x - string_width("Start Game") / 2, center_y + 100, "Start Game");
}

// Quit Option
if (menu_option == 1) {
    draw_set_font(fnt_bold);
    draw_text(center_x - string_width("Quit") / 2, center_y + 130, "Quit ");
    draw_set_font(fnt_default);
} else {
    draw_text(center_x - string_width("Quit") / 2, center_y + 130, "Quit");
}

// How to Play Section
draw_text(center_x - string_width("How to Play") / 2, center_y + 180, "How to Play:");
draw_text(center_x - string_width("Use arrow keys to move") / 2, center_y + 210, "Use arrow keys to move");
draw_text(center_x - string_width("Press space to interact") / 2, center_y + 240, "Press space to interact");
draw_text(center_x - string_width("Avoid enemies and obstacles") / 2, center_y + 270, "Avoid enemies and obstacles");

// Fade overlay
if (fading_out) {
    draw_set_alpha(fade_opacity);  // Apply fade opacity
    draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);  // Black fade overlay
    draw_set_alpha(1);  // Reset alpha to normal
}