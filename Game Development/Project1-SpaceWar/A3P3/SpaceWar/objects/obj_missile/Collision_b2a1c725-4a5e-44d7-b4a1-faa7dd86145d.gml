/// @description Insert description here
// You can write your code in this editor

if(explosive){
	
	obj_spaceship.hit +=1
	
	if(obj_spaceship.hit > 100){
		instance_destroy(obj_spaceship)
		instance_destroy(obj_init)
		global.WINNER = 2
		room_goto(room_end)
	}
	

}
