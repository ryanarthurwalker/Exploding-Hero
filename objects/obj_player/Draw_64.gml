// Draw the timer in the top-left corner of the screen
var time_left = ceil(explosion_timer / room_speed); // Convert frames to seconds
draw_set_color(c_white); // Set text color to white
draw_text(10, 10, "Time Left: " + string(time_left) + "s"); // Display the timer