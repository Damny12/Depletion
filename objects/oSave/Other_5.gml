save={
	objects:[],
	IDs:[],
	positions:[],
	depths:[],
	assets:[],
	scales:[]
}

//objects
for (var i = 0;i<instance_number(all);i++){ 
	instanceSelf = method(instance_id[i], ReturnSelf)
	
	array_push(save.objects,instanceSelf())
	array_push(save.IDs,instance_id[i])
	array_push(save.positions,[instance_id[i].x,instance_id[i].y])
	array_push(save.depths,instance_id[i].depth)
	array_push(save.assets,instance_id[i].object_index)
	array_push(save.scales,[instance_id[i].image_xscale,instance_id[i].image_yscale])
}

save = json_stringify(save)

var _file = file_text_open_write("save.json")
file_text_write_string(_file, save)
file_text_close(_file)