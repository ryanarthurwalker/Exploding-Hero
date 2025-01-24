// Countdown the lifetime and destroy the bone when time runs out
lifetime -= 1;
if (lifetime <= 0) {
    instance_destroy();
}