/// @description Insert description here
// You can write your code in this editor
spd_x = 8
spd_y = 8
life_span = 0

// Spaceship speed affects missiles direction.
spd_x += obj_spaceship.spd_x / 2 * global.time_step
spd_y += obj_spaceship.spd_y / 2 * global.time_step