// Expand the explosion radius
explosion_radius += growth_rate;

// Limit the radius to the maximum size
if (explosion_radius >= max_radius) {
    explosion_radius = max_radius;
}

// Decrease the lifetime by 1 frame
lifetime -= 1;  // Subtract one frame from lifetime

// Destroy the freeze bomb once the explosion reaches its max radius or lifetime ends
if (lifetime <= 0) {
    instance_destroy();  // Destroy the freeze explosion effect
}