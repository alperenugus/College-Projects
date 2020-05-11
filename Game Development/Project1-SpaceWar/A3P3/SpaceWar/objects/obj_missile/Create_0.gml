/// @description Insert description here
// You can write your code in this editor
spd_x = 16
spd_y = 16
life_span = 0
explosive = false


alarm[0] = 10

// Spaceship speed affects missiles direction.
spd_x += obj_spaceship.spd_x * cos(pi / 180 * obj_spaceship.image_angle)
spd_y += obj_spaceship.spd_y * sin(pi / 180 * obj_spaceship.image_angle)