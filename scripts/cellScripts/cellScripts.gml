function get_coords(_x, _y){
	return {x : _x div CELL_SIZE, y : _y div CELL_SIZE}
}

function get_cell(_x, _y){
	var _coords = get_coords(_x, _y);
	
	if (_coords.x < 0 || _coords.y < 0 || _coords.x >= obj_grid.hcells || _coords.y >= obj_grid.vcells){
		return undefined;	
	}
	
	return global.grid[_coords.x][_coords.y];
}
			