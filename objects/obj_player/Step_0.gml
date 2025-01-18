if (keyboard_check(vk_left)) x -= 4;
if (keyboard_check(vk_right)) x += 4;
if (keyboard_check(vk_up)) y -= 4;
if (keyboard_check(vk_down)) y += 4;


explosion_timer -= 1;
if (explosion_timer <= 0) {
    instance_create_layer(x, y, "Instances", obj_explosion);
    instance_destroy(); // Player explodes!
}