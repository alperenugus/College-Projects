// Set the right angle
angle = image_angle + 90

// Increment speed with respect to acceleration 
// Check the edge points for max and min values
if(spd_x <= global.MAX_SPEED && spd_x >= -1 * global.MAX_SPEED)
spd_x += acc_x * global.time_step
if(spd_x > global.MAX_SPEED) spd_x = global.MAX_SPEED
if(spd_x < -1 * global.MAX_SPEED) spd_x = -1 * global.MAX_SPEED

if(spd_y <= global.MAX_SPEED && spd_y >= -1 * global.MAX_SPEED)
spd_y += acc_y * global.time_step
if(spd_y > global.MAX_SPEED) spd_y = global.MAX_SPEED
if(spd_y < -1 * global.MAX_SPEED) spd_y = -1 * global.MAX_SPEED



// Rotation counter-clockwise
if(keyboard_check(vk_left)){
	if(forward) image_angle += 1
	else image_angle -= 1
}
// Rotation clockwise
if(keyboard_check(vk_right)){
	if(forward) image_angle -= 1
	else image_angle += 1
}

if(keyboard_check(vk_up)){
	// Set direction to forward
	forward = true
	// Up arrow incrementing acceleration
	acc_x += 0.08 * cos(pi/180*angle)
	acc_y += 0.08 * sin(pi/180*angle)
	// Thrust sprite
	sprite_index = s_spaceship_flame
}

if(keyboard_check_released(vk_up)){
	// Releasing thrust will result in 0 acceleration.
	acc_x = 0
	acc_y = 0
	// No thrust sprite
	sprite_index = s_spaceship
}


// Continuously change location with respect to the speed vector.
x += spd_x * global.time_step;
y -= spd_y * global.time_step;


// Missile launch
if(keyboard_check(vk_down)){
	var missile_inst
	// Prevent continuous missile creation.
	if(global.MISSILE_INSTANCE_TIMER mod 10 == 0){
		missile_inst = instance_create_depth(x, y, 0, obj_missile)
		// Set missile image angle as the same as the spaceship angle.
		missile_inst.image_angle = angle
	}
	global.MISSILE_INSTANCE_TIMER++
}

