/// @description Insert description here
// You can write your code in this editor

life_span += 0.02

if(life_span > global.MAX_MISSILE_LIFESPAN){
	instance_destroy()
}

// Continuously change location with respect to the speed vector.
x += spd_x * cos(pi / 180 * image_angle)
y -= spd_y * sin(pi / 180 * image_angle)

if(alarm[0] == -1){
	explosive = true
}

// Gravity
dist2sun = sqrt(sqr(x - obj_sun.x) + sqr(y - obj_sun.y))
sunGravity = global.GM1M2 / sqr(dist2sun)
angle2sun = point_direction(x, y, obj_sun.x, obj_sun.y)
sunGravity_x = sunGravity * cos(pi/180 * angle2sun)
sunGravity_y = sunGravity * sin(pi/180 * angle2sun)

spd_x += sunGravity_x * global.time_step
spd_y += sunGravity_y * global.time_step
 

