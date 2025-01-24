// Collision Event for obj_arrow with obj_npc

// Destroy the NPC instance
instance_destroy(other);

// Leave behind a bone at the NPC's location
instance_create_layer(other.x, other.y, "Instances", obj_bone);

// Destroy the arrow instance after the collision
instance_destroy();