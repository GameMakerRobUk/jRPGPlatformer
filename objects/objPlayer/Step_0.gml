if (can_move){
	target_y = y;
	target_x = x;
	
	if (keyboard_check_pressed(vk_space)){
		check_ascend();
	}
	
	function check_descend(){
		/*
			Possibilities:
			- Blocked (Higher level)
			- Same level/height
			- Lower level/height
		*/
	}
	
	if (keyboard_check(ord("W")) || keyboard_check(ord("S")) || keyboard_check(ord("A")) || keyboard_check(ord("D"))){
		//target_y = y - 32;
		//facing = FACING.UP;
		check_descend(facing);
	}
	//else if (keyboard_check(ord("S"))){
	//	//target_y = y + 32;
	//	//facing = FACING.DOWN;
	//}
	//else if (keyboard_check(ord("A"))){
	//	//target_x = x - 32;
	//	//facing = FACING.LEFT;
	//}
	//else if (keyboard_check(ord("D"))){
	//	//target_x = x + 32;
	//	//facing = FACING.RIGHT;
	//}
	
	if (cell_is_blocked(target_x, target_y)){
		target_y = y;
		target_x = x;
	}
	
	if (target_y != y || target_x != x){
		coords = get_coords(target_x, target_y);
		update_draw_priority(id);
		can_move = false;	
	}
}

if (using_ac_curve){
	curve.timer += curve.inc;
	show_debug_message("curve.timer: " + string(curve.timer))
	for (var i = 0; i < array_length(curve.channels); i ++){
		var _channel = curve.channels[i];
		var _value = animcurve_channel_evaluate(_channel, curve.timer);
		show_debug_message("_channel: " + string(_channel))
		switch _channel.name{
			case "x" :{
				x = start_x + _value;	
				show_debug_message("y channel: " + string({x : x, start_x : start_x, value: _value}))
			}; break;
			case "y" :{
				y = start_y + _value;	
				show_debug_message("y channel: " + string({y : y, start_y : start_y, value: _value}))
			}; break;
			case "z" :{
				z = start_z + _value;	
				show_debug_message("z channel: " + string({z : z, start_z : start_z, value: _value}))
			}; break;
			case "level" :{
				if (curve.timer == 1){
					level += _value;	
				}
			}; break;
		}
	}
	update_draw_priority(id);
	
	if (curve.timer > 1){
		curve_finished();
	}
	
}else{
	if (y != target_y){
		y += (sign(target_y - y) * move_speed);	
		//show_debug_message("updating y")
	}
	if (x != target_x){
		x += (sign(target_x - x) * move_speed);	
		if (x == target_x){
		}
	}

	if (x == target_x && y == target_y){
		can_move = true;	
	}
}

if (keyboard_check_pressed(vk_tab)){
	global.debug = !global.debug;	
}