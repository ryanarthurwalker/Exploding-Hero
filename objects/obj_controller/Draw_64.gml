// Draw the timer, score, and level in the GUI layer
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Timer
if (explosion_timer > 0) {
    var time_left = ceil(explosion_timer / room_speed);
    draw_text(10, 10, "Time Left: " + string(time_left) + "s");
} else {
    draw_text(10, 10, "Explosion triggered!");
}

// Score
draw_text(10, 30, "Score: " + string(global.score));

// Level
draw_text(10, 50, "Level: " + string(level));