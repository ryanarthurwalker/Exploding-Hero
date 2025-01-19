draw_self();

if (global.magnet_active) {
    draw_set_color(c_grey); // Aura color
    draw_circle(x, y, 40, false); // Draw a glowing aura around the player (adjust size as needed)
}

// Visual feedback for speed boost
if (global.speed_boost_active) {
    draw_set_color(c_yellow); // Set color to yellow for speed boost
    draw_circle(x, y, 40, false); // Draw a glowing aura (adjust size as needed)
}

// Draw the player sprite
draw_self();