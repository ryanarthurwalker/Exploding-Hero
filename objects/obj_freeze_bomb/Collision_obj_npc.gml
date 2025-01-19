// Trigger explosion
instance_create_layer(x, y, "Instances", obj_freeze_explosion_effect);

// Destroy the bomb
instance_destroy();