if (is_attacking) {
    // Deduct player health
    global.health -= 10; // Adjust damage as needed

    // Visual cue for attack (optional)
    show_debug_message("Player hit by melee attack!");

    // Knockback effect (optional)
    var knockback_angle = point_direction(x, y, other.x, other.y);
    other.x += lengthdir_x(10, knockback_angle); // Adjust knockback distance
    other.y += lengthdir_y(10, knockback_angle);
}