// Draw the player sprite
draw_self();

// Draw the health bar above the player's head
var bar_width = 50; // Width of the health bar
var bar_height = 5; // Height of the health bar
var bar_offset = -50; // Offset above the player's head

// Calculate the percentage of health
var health_percentage = global.health / global.max_health;

// Draw the background of the health bar (red)
draw_rectangle_color(
    x - bar_width / 2, y + bar_offset, 
    x + bar_width / 2, y + bar_offset + bar_height, 
    c_red, c_red, c_red, c_red, false
);

// Draw the foreground of the health bar (green, representing current health)
draw_rectangle_color(
    x - bar_width / 2, y + bar_offset, 
    x - bar_width / 2 + bar_width * health_percentage, 
    y + bar_offset + bar_height, 
    c_green, c_green, c_green, c_green, false
);

if (global.magnet_active) {
    draw_set_color(c_grey); // Aura color
    draw_circle(x, y, 40, false); // Draw a glowing aura around the player (adjust size as needed)
}

// Visual feedback for speed boost
if (global.speed_boost_active) {
    draw_set_color(c_yellow); // Set color to yellow for speed boost
    draw_circle(x, y, 40, false); // Draw a glowing aura (adjust size as needed)
}

