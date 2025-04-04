function add_to_draw_queue(_id){
	with obj_draw{
		var _p = -_id.coords.y;
		if (_id.object_index == objPlayer){
			_p -= 16;
		}
		ds_priority_add(queue, _id, _p);	
	}
}
function update_draw_priority(_id){
	with obj_draw{
		var _p = -_id.coords.y;
		if (_id.object_index == objPlayer){
			_p -= 16;
		}
		ds_priority_change_priority(queue, _id, _p);	
	}	
}