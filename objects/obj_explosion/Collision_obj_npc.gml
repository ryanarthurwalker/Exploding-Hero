with (obj_npc) {
    if (point_distance(x, y, other.x, other.y) <= explosion_radius) {
        instance_destroy();
    }
}