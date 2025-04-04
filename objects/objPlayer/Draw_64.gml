draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (global.debug){
	draw_text(0, 0, "x: " + string(x));
	draw_text(0, 20, "y: " + string(y) + "/" + string(start_y));
	draw_text(0, 40, "z: " + string(z) + "/" + string(start_z));
	draw_text(0, 60, "level: " + string(level));
	draw_text(0, 80, "coords: " + string(coords));
}
