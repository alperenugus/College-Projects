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
missile_x = x - obj_sun.x
missile_y = y - obj_sun.y

dist2sun = sqrt(sqr(x - obj_sun.x) + sqr(y - obj_sun.y))

acc_x = global.GM1M2 * missile_x / (dist2sun * dist2sun * dist2sun)
acc_y = global.GM1M2 * missile_y / (dist2sun * dist2sun * dist2sun)

spd_x += acc_x * global.time_step
spd_y += acc_y * global.time_step
 

