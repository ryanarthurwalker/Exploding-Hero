// Expand the explosion radius
explosion_radius += expansion_speed;

// Destroy the explosion object when it exceeds max_radius
if (explosion_radius >= max_radius) {
    instance_destroy(); // Remove the explosion object
    return; // No further checks are needed after the object is destroyed
}

