if (!initialised){
	hcells = room_width div CELL_SIZE;
	vcells = room_height div CELL_SIZE;
	global.grid = [];

	for (var yy = 0; yy < vcells; yy ++){
		for (var xx = 0; xx < hcells; xx ++){
			global.grid[xx][yy] = {blocked : [false, false, false, false, false], height : 0};
		}	
	}

	with par_block{
		global.grid[coords.x][coords.y].blocked = blocked;
		global.grid[coords.x][coords.y].height = height;
	}
	
	initialised = true;
}