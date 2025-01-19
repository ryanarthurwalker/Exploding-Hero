// Draw Event for obj_freeze_explosion_effect

// Apply scaling to the sprite based on explosion radius
var scale_factor = explosion_radius / 100;  // Adjust the scale factor to fit your needs

// Apply scaling to the sprite
image_xscale = scale_factor;
image_yscale = scale_factor;

// Draw the sprite (using its normal positioning and scaled size)
draw_self();