// Revert to the previous position to avoid sticking
x = xprevious;
y = yprevious;

// Calculate escape direction
var escape_angle = point_direction(other.x, other.y, x, y);
var escape_distance = 16; // Distance to move away from the wall

// Set the escape target
escape_target_x = x + lengthdir_x(escape_distance, escape_angle);
escape_target_y = y + lengthdir_y(escape_distance, escape_angle);

// Activate escape mode
escape_mode = true;