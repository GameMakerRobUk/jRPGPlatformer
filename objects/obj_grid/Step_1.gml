if (!initialised){
	hcells = room_width div CELL_SIZE;
	vcells = room_height div CELL_SIZE;
	global.grid = [];

	for (var yy = 0; yy < vcells; yy ++){
		for (var xx = 0; xx < hcells; xx ++){
			global.grid[xx][yy] = {height : 0, blocked : [false, false, false, false, false]};
		}	
	}

	with par_block{
		global.grid[coords.x][coords.y].height = height;
		
		for (var i = 0; i < height; i ++){
			global.grid[coords.x][coords.y].blocked[i] = true;
		}
	}
	
	with par_slope{
		struct_set(global.grid[coords.x][coords.y], "slope", id);
	}
	
	with par_platform{
		struct_set(global.grid[coords.x][coords.y], "platform", id);
		global.grid[coords.x][coords.y].height = height;
	}
	
	initialised = true;
}