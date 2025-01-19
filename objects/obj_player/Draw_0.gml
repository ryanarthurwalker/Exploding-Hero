draw_self();

if (global.magnet_active) {
    draw_set_color(c_yellow); // Aura color
    draw_circle(x, y, 40, false); // Draw a glowing aura around the player (adjust size as needed)
}

// Draw the player sprite
draw_self();
