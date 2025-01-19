// Expand the explosion radius
explosion_radius += growth_rate;

// Limit the radius to the maximum size
if (explosion_radius >= max_radius) {
    explosion_radius = max_radius;
}

// Reduce the lifetime of the explosion effect
lifetime -= 1;

// Destroy the explosion effect when its lifetime ends
if (lifetime <= 0) {
    instance_destroy();
}