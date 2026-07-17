if (!hovering and position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)){
	stretchX = 0.5
	stretchY = -0.25
	angle = irandom_range(-10,10)
}

hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)

if (hovering and mouse_check_button(mb_left)){
	dragging=true
}

if (!mouse_check_button(mb_left)){
	dragging=false
}

if (dragging) {
	x=mouse_x
	x=clamp(x,startX,endX+startX)
	
	var _increment = endX/ (maxVal-minVal)
	value=round((x-startX) / _increment)
	x=value*_increment+startX
	valHandler(value)
}

stretchX = powerTween(stretchX, 0, 0.55, 2)
stretchY = powerTween(stretchY, 0, 0.55, 2)
angle = powerTween(angle, 0, 0.55, 2)