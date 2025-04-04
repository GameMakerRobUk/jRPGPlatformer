function get_coords(_x, _y){
	return {x : _x div CELL_SIZE, y : _y div CELL_SIZE}
}

function is_blocked(_coords, _level){
	return global.grid[_coords.x][_coords.y].blocked[_level];
}

function cell_is_blocked(_target_x, _target_y, _level = 0){
	var _coords = get_coords(_target_x, _target_y);
	return is_blocked(_coords, _level);
}