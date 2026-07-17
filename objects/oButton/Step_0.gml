if (allow_hovering){
	if (!follow_player){
		if (!hovering and position_meeting(device_mouse_x(0), device_mouse_y(0), self)){
			stretchX = 1
			stretchY = -0.5
			angle = irandom_range(-5,5)
		}
		
		hovering = position_meeting(device_mouse_x(0), device_mouse_y(0), self)
	}else{
		if (!hovering and position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)){
			stretchX = 1
			stretchY = -0.5
			angle = irandom_range(-5,5)
		}
		
		hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)
	}
}

if (hovering && mouse_check_button_pressed(mb_left)) {
	func()
}

stretchX = powerTween(stretchX, 0, 0.55, 2)
stretchY = powerTween(stretchY, 0, 0.55, 2)
angle = powerTween(angle, 0, 0.55, 2)