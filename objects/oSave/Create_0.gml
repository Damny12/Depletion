if (file_exists("saveData.dat")){
	var _buffer = buffer_load("saveData.dat")
	
	buffer_seek(_buffer,buffer_seek_start,0)

	var _save = buffer_read(_buffer,buffer_string)
	show_debug_message(_save)
	buffer_delete(_buffer)
}