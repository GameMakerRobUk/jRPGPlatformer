function curve_finished(){
	show_debug_message("curve_finished")
	using_ac_curve = false;
	can_move = true;
	curve.timer = 0;
	start_x = x;
	start_y = y;
	start_z = z;
	target_y = y;
	target_x = x;
	coords = get_coords(x, y);
	
	show_debug_message("x: " + string(x) + ", y: " + string(y) + ", coords: " + string(coords));
}