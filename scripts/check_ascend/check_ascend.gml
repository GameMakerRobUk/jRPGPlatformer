function set_default_player_vars(){
	can_move = false;
	using_ac_curve = true;
	start_y = y;
	start_x = x;
	start_z = z;
}

function check_ascend(){		
	switch facing{
		case FACING.UP : {
			show_debug_message("FACING UP");
			//if we're at the top edge, exit
			if (coords.y == 0){
				show_debug_message("WE'RE AT THE TOP EDGE")
				return;	
			}
				
			var _coords = get_coords(x, y - CELL_SIZE);
			//get the cell and check its height
			var _cell = global.grid[_coords.x][_coords.y];
			
			if (_cell.height - level == 1){
				curve = ascend.UP;
				set_default_player_vars();
				return;
			}else{
				show_debug_message("NOT Facing a block which is one level higher");
			}
		}; break;
		case FACING.DOWN : curve = ascend.DOWN; break;
		case FACING.LEFT : curve = ascend.LEFT; break;
		case FACING.RIGHT : {
			show_debug_message("FACING RIGHT");
			
			//if we're at the right edge, exit
			if (coords.x == obj_grid.hcells - 1){
				show_debug_message("WE'RE AT THE RIGHT EDGE")
				return;	
			}
			
			var _coords = get_coords(x + CELL_SIZE, y);
			show_debug_message("_coords: " + string(_coords));
			//get the cell and check its height
			var _cell = global.grid[_coords.x][_coords.y];
			show_debug_message("_cell: " + string(_cell));
			show_debug_message("level: " + string(level));
			show_debug_message("_cell.height: " + string(_cell.height));
			if (_cell.height - level == 1){
				curve = ascend.RIGHT;
				set_default_player_vars();
				return;
			}else{
				show_debug_message("NOT Facing a block which is one level higher");
			}
		}
	}
}