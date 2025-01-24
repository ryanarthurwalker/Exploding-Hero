// Decelerate the arrow over time
if (speed > min_speed) {
    speed -= deceleration; // Reduce speed gradually
} else {
    speed = min_speed; // Ensure the arrow doesn't go below the minimum speed
}

// Calculate the movement for this step
var dx = lengthdir_x(speed, direction);
var dy = lengthdir_y(speed, direction);

// Move the arrow
x += dx;
y += dy;

// Update the total distance traveled
distance_traveled += point_distance(0, 0, dx, dy);

// Check if the arrow has traveled its maximum distance
if (distance_traveled >= max_distance) {
    instance_destroy(); // Destroy the arrow if it exceeds the max distance
}

// Destroy the arrow if it moves outside the room boundaries
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}