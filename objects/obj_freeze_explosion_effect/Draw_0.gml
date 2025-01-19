// Use explosion_radius to control the scale, but with a fixed base size to prevent excessive scaling
var scale_factor = explosion_radius / 100; // Adjust 100 for desired scaling factor

// Apply scaling to the sprite
image_xscale = scale_factor;
image_yscale = scale_factor;

// Draw the sprite (using its normal positioning and scaled size)
draw_self();