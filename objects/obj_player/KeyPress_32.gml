if (global.freeze_bomb_count > 0) {
    global.freeze_bomb_count -= 1; // Reduce bomb count

    // Calculate the starting position slightly in front of the player
    var bomb_start_x = x + lengthdir_x(16, image_angle);
    var bomb_start_y = y + lengthdir_y(16, image_angle);

    // Create the freeze bomb
    var bomb = instance_create_layer(bomb_start_x, bomb_start_y, "Instances", obj_freeze_bomb);

    // Set the bomb's direction and speed
    bomb.direction = image_angle;
    bomb.speed = 8;
}