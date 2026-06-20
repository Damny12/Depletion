if (tipHeavy){
	if (image_xscale==-1){
		image_angle=direction+180
	}else{
		image_angle=direction
	}
}

if (keyboard_check_pressed(vk_escape)){
	if (!oMenu.paused){
		gravity=originalGravity
		speed=originalSpeed
	}{
		speed=0
		gravity=0
	}
}