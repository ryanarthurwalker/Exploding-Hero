// Move the bomb
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Check if the bomb has traveled beyond its maximum distance
var distance_traveled = point_distance(starting_x, starting_y, x, y);
if (distance_traveled >= max_distance) {
    // Trigger explosion
    instance_create_layer(x, y, "Instances", obj_freeze_explosion_effect);
    instance_destroy(); // Destroy the bomb
}