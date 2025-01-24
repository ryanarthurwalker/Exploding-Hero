// Collision Event: obj_bone with obj_player

// Add 1 to the player's bone counter (or handle your pickup logic)
global.bones += 1;

// Destroy the bone after pickup
instance_destroy();