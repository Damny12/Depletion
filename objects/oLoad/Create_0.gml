if (file_exists("save.json")){
	var _file = file_text_open_read("save.json")
	
	save = json_parse(file_text_read_string(_file))
	
	file_text_close(_file)
	
	for (var i = 0;i<array_length(save.objects);i++){
		positions = save.positions[i]
		variables = save.objects[i]
		
		variables.image_xscale = save.scales[i][0]
		variables.image_yscale = save.scales[i][1]
		
		instance_create_depth(positions[0],
		positions[1],
		save.depths[i],
		save.assets[i],
		variables)
	}
}else{
	show_debug_message("'save.json' does not exist.")
	room_goto(Menu)
}