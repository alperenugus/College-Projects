/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_set_colour(c_white);
draw_text_transformed(0, 0, "spd_x: " + string(spd_x), 3, 3, 0)
draw_text_transformed(0, 30, "spd_y: " + string(spd_y), 3, 3, 0)
draw_text_transformed(0, 60, "acc_x: " + string(acc_x), 3, 3, 0)
draw_text_transformed(0, 90, "acc_y: " + string(acc_y), 3, 3, 0)
draw_text_transformed(0, 120, "angle: " + string(angle), 3, 3, 0)
draw_text_transformed(0, 150, "angle2sun: " + string(angle2sun), 3, 3, 0)
draw_text_transformed(0, 180, "dist2sun: " + string(dist2sun), 3, 3, 0)
draw_text_transformed(0, 210, "sunGravity: " + string(sunGravity), 3, 3, 0)

//draw_text_transformed(0, 150, "x coord: " + string(x), 3, 3, 0)
//draw_text_transformed(0, 180, "room width: " + string(room_width), 3, 3, 0)
//draw_text_transformed(0, 90, "time_step: " + string(global.time_step), 3, 3, 0)

