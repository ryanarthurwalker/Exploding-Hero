if (global.game_paused) {
    draw_set_color(c_white);
    draw_text(room_width / 2 - 50, room_height / 2, "Game Paused");
}

if (global.game_paused) {
    draw_set_color(c_black);
    draw_set_alpha(0.5); // Semi-transparent overlay
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1); // Reset alpha
}

draw_set_color(c_white);
draw_text(10, 70, "Freeze Bombs: " + string(global.freeze_bomb_count));