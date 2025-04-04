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
			//Get the cell
			var _cell = get_cell(x, y - CELL_SIZE);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
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
			
				
		}; break;
		case FACING.DOWN : {
			//Get the cell
			var _cell = get_cell(x, y + CELL_SIZE);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
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
			
			switch _height_diff{
				case 1 : curve = descend.DOWN[0]; break;	
				case 2 : curve = descend.DOWN[1]; break;	
				case 3 : curve = descend.DOWN[2]; break;	
			}
			
		}; break;
		case FACING.LEFT:{
			//Get the cell
			var _cell = get_cell(x - CELL_SIZE, y);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
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
			
				
		}; break;
		case FACING.RIGHT:{
			//Get the cell
			var _cell = get_cell(x + CELL_SIZE, y);
			if (_cell == undefined){
				show_debug_message("cell is undefined");
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
			
				
		}; break;
	}
}