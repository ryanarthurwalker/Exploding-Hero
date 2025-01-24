// Draw the NPC normally
draw_self();

// Indicate attacking state (e.g., draw a sword or glow effect)
if (is_attacking) {
    draw_circle_color(x + lengthdir_x(attack_range, image_angle), y + lengthdir_y(attack_range, image_angle), 10, c_red, c_red, false);
}