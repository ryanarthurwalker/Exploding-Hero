// Destroy the NPC when collision occurs
instance_destroy(other); // Destroy the NPC
global.score += 100; // Increment score
show_debug_message("NPC destroyed! Score: " + string(global.score));