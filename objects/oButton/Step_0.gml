if (!follow_player){
	hovering = position_meeting(device_mouse_x(0), device_mouse_y(0), self)
}else{
	hovering = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self)
}
if (hovering && mouse_check_button_pressed(mb_left)) {
	func()
}
