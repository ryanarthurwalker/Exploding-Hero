// Initialize distance tracking and direction update timer
if (!distance_traveled_initialized) {
    start_x = x;
    start_y = y;
    distance_traveled = 0;
    direction_update_timer = 0; // Timer to control direction updates
    distance_traveled_initialized = true;
}

// Check if the player exists
if (instance_exists(obj_player)) {
    // Update direction every 5 frames (adjust as needed)
    direction_update_timer++;
    if (direction_update_timer >= 5 && distance_traveled < 200) {
        var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
        direction += (target_angle - direction) / heat_seeking_strength;
        direction_update_timer = 0; // Reset timer
    }

    // Always face the adjusted direction
    image_angle = direction;
}

// Move the projectile
var dx = lengthdir_x(speed, direction);
var dy = lengthdir_y(speed, direction);

x += dx;
y += dy;

// Calculate distance traveled
distance_traveled += point_distance(0, 0, dx, dy);

// Destroy the projectile if it travels more than 200 pixels
if (distance_traveled >= 200) {
    instance_destroy();
}