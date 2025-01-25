// Collision Event: obj_npc_melee with obj_player
if (is_attacking) {
    // Damage the player
    global.health -= 10; // Adjust damage value as needed

    // Add a knockback effect for the player (optional)
    var knockback_angle = point_direction(x, y, other.x, other.y);
    other.x += lengthdir_x(10, knockback_angle); // Adjust knockback distance
    other.y += lengthdir_y(10, knockback_angle);

    
}