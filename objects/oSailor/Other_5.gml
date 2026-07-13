if (part_emitter_exists(rainer,emitter)){
	part_emitter_destroy(rainer,emitter)
	show_debug_message("yo")
}

if (part_system_exists(rainer)){
	part_system_destroy(rainer)
	show_debug_message("yo")
}