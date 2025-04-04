can_move = true;
move_speed = 2;
z = 0;
height = 0;

draw = function(){
	//draw_sprite(spr_player_shadow, 0, x, y);
	draw_sprite(sprite_index, image_index, x, y - z);
	//draw_self();
}

coords = get_coords(x, y);

initialised = false;

enum FACING { UP, DOWN, LEFT, RIGHT };

facing = FACING.DOWN;

/*
	show_debug_message("player_jump");
	var _data = animcurve_get(_ac);
	var _channels = _data.channels;
	show_debug_message("_data: " + string(_data));
	show_debug_message("_channels: " + string(_channels));
	
	for (var i = 0; i < array_length(_channels); i ++){
		var _name = _channels[i].name;
		show_debug_message("_name: " + _name);
		var _channel_data = animcurve_get_channel(_ac, _name);
		show_debug_message("_channel_data: " + string(_channel_data));
		show_debug_message("0.5: " + string(animcurve_channel_evaluate(_channel_data, 0.5)));
	}
*/

ascend = {
	UP : { ac : ac_ascend_up, channels : [], timer : 0, inc : 0.1},
	DOWN : { ac : ac_ascend_down, channels : [], timer : 0, inc : 0.1},
	LEFT : { ac : ac_ascend_left, channels : [], timer : 0, inc : 0.1},
	RIGHT : { ac : ac_ascend_right, channels : [], timer : 0, inc : 0.1},
}

descend = {
	DOWN : [
			{ ac : ac_descend_down_1, channels : [], timer : 0, inc : 0.1},
			{ ac : ac_descend_down_2, channels : [], timer : 0, inc : 0.1},
			{ ac : ac_descend_down_3, channels : [], timer : 0, inc : 0.1},
	]
}

var _names = struct_get_names(ascend);

for (var i = 0; i < array_length(_names); i ++){
	var _name = _names[i];
	var _data = struct_get(ascend, _name);
	var _channels = animcurve_get(_data.ac).channels;
	
	for (var j = 0; j < array_length(_channels); j ++){
		array_push(_data.channels, _channels[j]);
	}
}

var _names = struct_get_names(descend);

for (var i = 0; i < array_length(_names); i ++){
	var _name = _names[i];
	var _structs = struct_get(descend, _name);
	
	show_debug_message("_structs: " + string(_structs))
	
	for (var j = 0; j < array_length(_structs); j ++){
	
		var _data = _structs[j];
		var _channels = animcurve_get(_data.ac).channels;
	
		for (var k = 0; k < array_length(_channels); k ++){
			array_push(_data.channels, _channels[k]);
		}
	}
}

using_ac_curve = false;
curve = ascend.UP;
start_x = x;
start_y = y;
start_z = z;
target_z = z;
