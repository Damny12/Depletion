hovering = position_meeting(device_mouse_x(0), device_mouse_y(0), self)

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