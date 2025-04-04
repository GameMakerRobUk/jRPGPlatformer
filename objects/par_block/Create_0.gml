coords = get_coords(x, y);

draw = 
	function(){
		if (!global.debug){
			draw_self();
		}else{
			draw_set_colour(c_red); 
			draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
			draw_set_colour(c_black);
			draw_text(x, y, string(height));
		}
	}
initialised = false;
height = 1;