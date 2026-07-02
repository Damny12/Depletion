if (ticks >= despawnTimer and despawnTimer>=0){
	instance_destroy()
}

if (!oMenu.paused){
	ticks++
}