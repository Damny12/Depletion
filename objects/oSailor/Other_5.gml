if (part_emitter_exists(rainer,emitter)){
	part_emitter_destroy(rainer,emitter)
}

if (part_system_exists(rainer)){
	part_system_destroy(rainer)
}