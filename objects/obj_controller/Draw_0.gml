// Draw UI
draw_set_color(c_white);
draw_text(10, 10, "Level: " + string(level));
draw_text(10, 30, "Score: " + string(global.score));

// Draw the explosion timer
if (explosion_timer > 0) {
    var time_left = ceil(explosion_timer / room_speed);
    draw_text(10, 50, "Time Left: " + string(time_left) + "s");
} else {
    draw_text(10, 50, "Explosion triggered!");
}