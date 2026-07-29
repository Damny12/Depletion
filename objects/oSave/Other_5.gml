save={
	gameVariables:global,
	room:oRooms.saveData
}

//objects
save = json_stringify(save)

var _file = file_text_open_write("save.json")
file_text_write_string(_file, save)
file_text_close(_file)

//debug save
save={
	gameVariables:global,
	room:oRooms.saveData
}

//objects
save = json_stringify(save,true)

_file = file_text_open_write("debug.json")
file_text_write_string(_file, save)
file_text_close(_file)