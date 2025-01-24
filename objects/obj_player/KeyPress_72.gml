// Create the arrow instance
var arrow = instance_create_layer(x, y, "Instances", obj_arrow);

// Set the arrow's initial direction and speed
arrow.direction = facing_direction; // Match the player's current facing direction
arrow.speed = 8;                   // Start with a high initial speed

// Align the arrow sprite to its direction
arrow.image_angle = arrow.direction; // Rotate the sprite to match the direction