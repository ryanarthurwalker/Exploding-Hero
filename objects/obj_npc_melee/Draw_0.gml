// Draw the NPC
draw_self();


// Indicate when the NPC is attacking
if (is_attacking) {
    draw_text(x - 20, y - 40, "Attacking!");
}