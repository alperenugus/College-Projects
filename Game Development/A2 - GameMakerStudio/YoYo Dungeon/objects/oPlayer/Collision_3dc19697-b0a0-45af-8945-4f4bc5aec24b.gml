/// @description Insert description here
// You can write your code in this editor



hp = hp - 10

if(hp <= 0){
	instance_destroy();
	game_restart();
}