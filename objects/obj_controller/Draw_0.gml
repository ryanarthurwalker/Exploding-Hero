// Set up for drawing
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Draw the current score
draw_text(10, 10, "Score: " + string(global.score));

// If the level is complete, display a message
if (level_complete) {
    var center_x = room_width / 2;
    var center_y = room_height / 2;
    draw_text(center_x, center_y - 50, "Level Complete!");
    draw_text(center_x, center_y, "Your Score: " + string(global.score));
    draw_text(center_x, center_y + 50, "Press Enter to Continue");
}