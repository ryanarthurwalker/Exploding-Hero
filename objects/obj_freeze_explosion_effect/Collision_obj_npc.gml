// Freeze the NPC
other.frozen = true; // Set the NPC to frozen
other.freeze_timer = room_speed * 5; // Freeze for 5 seconds

// Optional: Add visual feedback for the NPC being frozen
other.image_blend = make_color_rgb(0, 255, 255); // Cyan color