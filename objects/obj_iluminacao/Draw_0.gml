if surface_exists(sombra_surface){
	surface_set_target(sombra_surface);

draw_set_color(c_black);
draw_set_alpha(0.99);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(0.7)
draw_set_color(c_white);

gpu_set_blendmode(bm_subtract);
draw_circle(x,y,24 + irandom(2), false);
draw_set_alpha(0.3)
draw_circle(x,y,45 + irandom(2),false);
gpu_set_blendmode(bm_normal);

surface_reset_target();

}else {sombra_surface = surface_create(room_width, room_height);}
draw_surface(sombra_surface,0,0);
