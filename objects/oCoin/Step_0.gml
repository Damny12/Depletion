if (!oMenu.paused){
    y+=yVel
    x+=xVel
   
    yVel+=yGravity
    rotation+=rotVel
   
    if (yVel>yTerm){
        yVel=yTerm
    }
   
    if (y<0 or global.deactivateBubbles){
        instance_destroy()
    }
}