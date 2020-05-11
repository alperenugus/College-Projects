/// @description Insert description here
// You can write your code in this editor

life_span += 0.02

if(life_span > global.MAX_MISSILE_LIFESPAN){
	instance_destroy()
}

// Continuously change location with respect to the speed vector.
x += spd_x * cos(pi / 180 * image_angle)
y -= spd_y * sin(pi / 180 * image_angle)


