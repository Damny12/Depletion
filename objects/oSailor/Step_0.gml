if (thunderstorm){
	x+=4
	y += sin(x/64)*4
	image_angle=sin(x/64-10)*16
	var back = layer_background_get_id("Background")
	
	//lerp colour values
	r  = lerp(r,stormColour[0], 0.01)
	g  = lerp(g,stormColour[1], 0.01)
	b  = lerp(b,stormColour[2], 0.01)
	var col = make_colour_rgb(r,g,b)
	
	layer_background_blend(back, col)
}else{
	x+=1
	y += sin(x/16)*2
	image_angle=sin(x/16-10)*8
	
	var back = layer_background_get_id("Background")
	
	//lerp colour values
	r  = lerp(r,skyColour[0], 0.01)
	g  = lerp(g,skyColour[1], 0.01)
	b  = lerp(b,skyColour[2], 0.01)
	var col = make_colour_rgb(r,g,b)
	
	layer_background_blend(back, col)
}

if (x>room_width+sprite_width/2){
	x = -sprite_width
	if (irandom_range(1,10)>=6){
		y=ogY+32
		thunderstorm = true
		if (!part_system_exists(rainer)){
			rainer = part_system_create(ParticleSystemRain)
			part_system_position(rainer, room_width/2, 0)
		}
		emitter = part_emitter_create(rainer)
	}else{
		y=ogY
		thunderstorm = false
		if (part_system_exists(rainer)){
			rainer = part_system_destroy(rainer)
		}
		if (part_emitter_exists(rainer, emitter)){
			part_emitter_destroy(rainer,emitter)
		}
	}
}