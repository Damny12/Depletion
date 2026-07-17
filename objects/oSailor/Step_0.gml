if (position_meeting(mouse_x,mouse_y,self) and mouse_check_button_pressed(mb_left)){
	stretchX = -0.5
	stretchY = 1
}

stretchX = powerTween(stretchX, 0,0.35,2)
stretchY = powerTween(stretchY, 0,0.35,2)

if (thunderstorm){
	if (pulledUnder <= 0){
		x+=4
		y += sin(x/64)*4
		image_angle=sin(x/64-10)*16
	}
	var back = layer_background_get_id("Background")
	
	//lerp colour values
	r  = lerp(r,stormColour[0], 0.01)
	g  = lerp(g,stormColour[1], 0.01)
	b  = lerp(b,stormColour[2], 0.01)
	var col = make_colour_rgb(r,g,b)
	
	layer_background_blend(back, col)
}else{
	if (pulledUnder <= 0){
		x+=1
		y += sin(x/16)*2
		image_angle=sin(x/16-10)*8
	}
	var back = layer_background_get_id("Background")
	
	//lerp colour values
	r  = lerp(r,skyColour[0], 0.01)
	g  = lerp(g,skyColour[1], 0.01)
	b  = lerp(b,skyColour[2], 0.01)
	var col = make_colour_rgb(r,g,b)
	
	layer_background_blend(back, col)
}

if (x>room_width+sprite_width/2){
	y=ogY
	x = -sprite_width
	if (irandom_range(1,10)>=6){
		thunderstorm = true
		if (!part_system_exists(rainer)){
			rainer = part_system_create(ParticleSystemRain)
			part_system_position(rainer, room_width/2, 0)
		}
		emitter = part_emitter_create(rainer)
	}else{
		thunderstorm = false
		if (part_system_exists(rainer)){
			rainer = part_system_destroy(rainer)
		}
		if (part_emitter_exists(rainer, emitter)){
			part_emitter_destroy(rainer,emitter)
		}
	}
}

if (pulledUnder != 0){
	if (pulledUnder == 1){
		sprite_index = sSailingSlimeGrabbed
		if (tick == 90){
			pulledUnder = 2
		}
	}
	
	if (pulledUnder == 2){
		sprite_index = sBoat
		tickAmount = -3
		if (tick == 0){
			pulledUnder = -1
			tickAmount = 3
		}
	}
	
	tick+=tickAmount
	if (pulledUnder != -1){
		y = powerTween(ogY,room_height,(tick)/100,2)
	}
}

if (tick == 90 and pulledUnder == -1){
	if (global.tutorial == true){
		instance_create_depth(x,y,0,oTransition,{
			fading_out:false,
			target_room:Tutorial
		})
	}else{
		instance_create_depth(x,y,0,oTransition,{
			fading_out:false,
			target_room:Levels
		})
	}
}