if (oMenu.paused and !prev){
	originalGravity=gravity
	originalSpeed=speed
}

if (!oMenu.paused){
	if (tipHeavy){
		if (image_xscale==-1){
			image_angle=direction+180
		}else{
			image_angle=direction
		}
	}
	
	if (rotateInAir){
		image_angle+=speed
	}
	
	if (is_array(hitObject)){
		for (var i = 0;i<array_length(hitObject);i++){
			if (place_meeting(x,y,hitObject[i]) and destroyOnHitObject and hitObject[i]!=oPlayer){
				if (explodesOnDestroy){
					repeat (explodeCount) {
						instance_create_layer(x,y,"PlayerStuff",explodeInto)
					}
				}
				
				instance_destroy()
			}
		}
	}else{
		if (place_meeting(x,y,hitObject) and destroyOnHitObject and hitObject!=oPlayer){
			if (explodesOnDestroy){
				repeat (explodeCount) {
					instance_create_layer(x,y,"PlayerStuff",explodeInto)
				}
			}
			
			instance_destroy()
		}
	}
	
}else{
	speed=0
	gravity=0
}

if (!oMenu.paused and prev){
	speed=originalSpeed
	gravity=originalSpeed 
}

prev=oMenu.paused