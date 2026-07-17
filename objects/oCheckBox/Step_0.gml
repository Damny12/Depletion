if (check){
    sprite_index=sChecked
}else{
    sprite_index=sUnchecked
}

if (!hovering and position_meeting(device_mouse_x(0), device_mouse_y(0), self)){
	stretchX = 1
	stretchY = -0.5
	angle = irandom_range(-10,10)
}

hovering = position_meeting(device_mouse_x(0), device_mouse_y(0), self)

if (hovering && mouse_check_button_pressed(mb_left)) {
	func()
}

if (instance_exists(oMenu)){
    if (follow_player && !oMenu.paused){
       x+=oCamera.xspd
       y+=oCamera.yspd
   }
}

stretchX = powerTween(stretchX, 0, 0.55, 2)
stretchY = powerTween(stretchY, 0, 0.55, 2)
angle = powerTween(angle, 0, 0.55, 2)