if (!oMenu.paused){
	ticks++
	
	if (ticks>=lastingTick){
		instance_destroy(self)
	} 
}