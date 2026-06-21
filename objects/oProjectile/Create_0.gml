if (startLookingAtMouse){
	image_xscale=-1
	direction=point_direction(mouse_x,mouse_y,x,y)
}else{
	direction=(startDir+random_range(minAngle,maxAngle))*image_xscale
}
gravity_direction=270
originalSpeed=speedForce*image_xscale
originalGravity=gravityForce
y-=16

if (!oMenu.paused){
	gravity=originalGravity 
	speed=originalSpeed
}else{
	speed=0
	gravity=0
}
prev=oMenu.paused