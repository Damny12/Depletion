if (!oMenu.paused){
   ticks++
    
    x=oPlayer.x
    y=oPlayer.y
    
    if (ticks>=lastingTick){
        instance_destroy(self)
    } 
}