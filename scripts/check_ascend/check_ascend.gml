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
			
			if (_cell.height - height == 1){
				curve = ascend.UP;
				set_default_player_vars();
				return;
			}else{
				show_debug_message("NOT Facing a block which is one height higher");
			}
		}; break;
		case FACING.DOWN : {
			show_debug_message("FACING DOWN");
			
			//If we're at the left edge, exit
			if (coords.y == obj_grid.vcells - 1){
				show_debug_message("we're at the bottom edge, exiting");
				return;
			}
			
			var _coords = get_coords(x, y + CELL_SIZE);
			//get the cell and check its height
			var _cell = global.grid[_coords.x][_coords.y];
			if (_cell.height - height == 1){
				curve = ascend.DOWN;
				set_default_player_vars();
				return;
			}else{
				show_debug_message("NOT Facing a block which is one height higher");
			}
		}
		case FACING.LEFT : {
			show_debug_message("FACING LEFT");
			
			//If we're at the left edge, exit
			if (coords.x == 0){
				show_debug_message("we're at the left edge, exiting");
				return;
			}
			
			var _coords = get_coords(x - CELL_SIZE, y);
			//get the cell and check its height
			var _cell = global.grid[_coords.x][_coords.y];
			if (_cell.height - height == 1){
				curve = ascend.LEFT;
				set_default_player_vars();
				return;
			}else{
				show_debug_message("NOT Facing a block which is one height higher");
			}
		}
		case FACING.RIGHT : {
			show_debug_message("FACING RIGHT");
			
			//if we're at the right edge, exit
			if (coords.x == obj_grid.hcells - 1){
				show_debug_message("WE'RE AT THE RIGHT EDGE")
				return;	
			}
			
			//get the cell and check its height
			var _cell = get_cell(x + CELL_SIZE, y);
			if (_cell.height - height == 1){
				curve = ascend.RIGHT;
				set_default_player_vars();
				return;
			}else{
				show_debug_message("NOT Facing a block which is one height higher");
			}
		}
	}
}