if (fading_out){
	image_alpha -= 1/lasting_tick
}else{
	image_alpha += 1/lasting_tick
}

if (image_alpha<=0 and fading_out){
	instance_destroy()
}

if (image_alpha >=1 and !fading_out){
	room_goto(target_room)
}