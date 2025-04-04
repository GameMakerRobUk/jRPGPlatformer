// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_descend(_facing){
	show_debug_message("check_descend")
	/*
		Possibilities:
		- (Higher height)
		- Same level/height
		- Lower level/height
	*/
	switch _facing{
		case FACING.UP:{
			show_debug_message("UP");
			//Get the cell
			var _cell = get_cell(x, y - CELL_SIZE);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
				return;	
			}
			
			if (struct_get(_cell, "slope") != undefined || struct_get(get_cell(x, y), "slope") != undefined){
				show_debug_message("There's a slope");
				traverse_slope(facing);
				return;
			}
				
			//Determine whether it's higher, lower, or same height
			var _height_diff = height - _cell.height;
				
			show_debug_message("_height_diff: " + string(_height_diff));
				
			//Cell is higher
			if (_height_diff < 0){
				show_debug_message("cell is higher, exiting");
				return;
			}
				
			//Cell is same
			if (_height_diff == 0){
				show_debug_message("height is the same")
				target_y = y - CELL_SIZE;
				can_move = false;
				return;
			}
			
			//Cell is lower - height difference can be variable here
			set_default_player_vars();
			
			curve = descend.UP[_height_diff];	
				
		}; break;
		case FACING.DOWN : {
			show_debug_message("DOWN");
			//Get the cell
			var _cell = get_cell(x, y + CELL_SIZE);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
				return;	
			}
			
			if (struct_get(_cell, "slope") != undefined || struct_get(get_cell(x, y), "slope") != undefined){
				show_debug_message("There's a slope");
				traverse_slope(facing);
				return;
			}
				
			//Determine whether it's higher, lower, or same height
			var _height_diff = height - _cell.height;
				
			show_debug_message("_height_diff: " + string(_height_diff));
				
			//Cell is higher
			if (_height_diff < 0){
				show_debug_message("cell is higher, exiting");
				return;
			}
				
			//Cell is same
			if (_height_diff == 0){
				show_debug_message("height is the same")
				target_y = y + CELL_SIZE;
				can_move = false;
				return;
			}
			
			//Cell is lower - height difference can be variable here
			set_default_player_vars();
			curve = descend.DOWN[_height_diff];	
			
		}; break;
		case FACING.LEFT:{
			show_debug_message("LEFT");
			//Get the cell
			var _cell = get_cell(x - CELL_SIZE, y);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
				return;	
			}
			
			var _slope_left = struct_get(_cell, "slope")
			
			if (_slope_left != undefined){
				show_debug_message("There's a slope");
				traverse_slope(facing, _slope_left);
				return;
			}
			
			var _slope = struct_get(get_cell(x, y), "slope");
			if (_slope != undefined){
				show_debug_message("There's a slope");
				traverse_slope(facing, _slope);
				return;
			}
				
			//Determine whether it's higher, lower, or same height
			var _height_diff = height - _cell.height;
				
			show_debug_message("_height_diff: " + string(_height_diff));
				
			//Cell is higher
			if (_height_diff < 0){
				show_debug_message("cell is higher, exiting");
				return;
			}
				
			//Cell is same
			if (_height_diff == 0){
				show_debug_message("height is the same")
				target_x = x - CELL_SIZE;
				can_move = false;
				return;
			}
			
			//Cell is lower - height difference can be variable here
			set_default_player_vars();
			curve = descend.LEFT[_height_diff];		
		}; break;
		case FACING.RIGHT:{
			show_debug_message("RIGHT");
			//Get the cell
			var _cell = get_cell(x + CELL_SIZE, y);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
				return;	
			}
			
			var _slope_right = struct_get(_cell, "slope")
			
			if (_slope_right != undefined){
				show_debug_message("There's a slope");
				traverse_slope(facing, _slope_right);
				return;
			}
			
			var _slope = struct_get(get_cell(x, y), "slope");
			if (_slope != undefined){
				show_debug_message("There's a slope");
				traverse_slope(facing, _slope);
				return;
			}
				
			//Determine whether it's higher, lower, or same height
			var _height_diff = height - _cell.height;
				
			show_debug_message("_height_diff: " + string(_height_diff));
				
			//Cell is higher
			if (_height_diff < 0){
				show_debug_message("cell is higher, exiting");
				return;
			}
				
			//Cell is same
			if (_height_diff == 0){
				show_debug_message("height is the same")
				target_x = x + CELL_SIZE;
				can_move = false;
				return;
			}
			
			//Cell is lower - height difference can be variable here
			set_default_player_vars();
			curve = descend.RIGHT[_height_diff];
		}; break;
	}
}