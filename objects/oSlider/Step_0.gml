lastDrag=dragging
if !lastDrag{
	dragging=mouse_check_button(mb_left) && position_meeting(mouse_x,mouse_y,id)
}

if dragging{
	x=mouse_x
}

if !mouse_check_button(mb_left){
	dragging=false
}

if x<minX{
	x=minX
}

if x>maxX{
	x=maxX
}