function traverse_slope(_facing, _slope){
	set_default_player_vars();
	
	show_debug_message("_slope: " + string(_slope))
	
	switch _facing {
		case FACING.LEFT: {
			var _curve = {
				ac : _slope.ac, channels : [], timer : 0, inc : 0.1,
			}
			
			var _channels = animcurve_get(_curve.ac).channels;
	
			for (var j = 0; j < array_length(_channels); j ++){
				array_push(_curve.channels, _channels[j]);
			}

		curve = _curve;
			
		};break;
		case FACING.RIGHT:{
			
		};break;
	}
}