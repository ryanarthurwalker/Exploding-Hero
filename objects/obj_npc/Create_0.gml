escape_mode = false; // Whether the NPC is escaping from a wall
escape_target_x = 0; // Target x-coordinate to move away from the wall
escape_target_y = 0; // Target y-coordinate to move away from the wall
escape_speed = 1;    // Speed at which the NPC escapes
frozen = false; // NPC starts unfrozen
freeze_timer = 0; // Countdown timer for freeze state
original_speed = speed; // Store the original speed for restoring