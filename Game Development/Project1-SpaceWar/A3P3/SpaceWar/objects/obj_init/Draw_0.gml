/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);
draw_text_transformed(room_width - 600, 100, "Player1 Hit: " + string(obj_spaceship.hit), 3, 3, 0)
draw_text_transformed(room_width - 600, 140, "Player1 Fuel: " + string(obj_spaceship.fuel), 3, 3, 0)
draw_text_transformed(room_width - 600, 180, "Player1 Missile #: " + string(obj_spaceship.missile_num), 3, 3, 0)
draw_text_transformed(0, 100, "Player2 Hit: " + string(obj_spaceship2.hit), 3, 3, 0)
draw_text_transformed(0, 140, "Player2 Fuel: " + string(obj_spaceship2.fuel), 3, 3, 0)
draw_text_transformed(0, 180, "Player2 Missile #: " + string(obj_spaceship2.missile_num), 3, 3, 0)