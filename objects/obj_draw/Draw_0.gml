ds_priority_copy(temp_queue, queue)

while (ds_priority_size(temp_queue) > 0){
	var _asset = ds_priority_delete_max(temp_queue);
	
	with _asset{
		draw();	
	}
}