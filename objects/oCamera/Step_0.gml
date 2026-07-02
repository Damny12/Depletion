if (!oMenu.paused){
	if (!global.newCameraMode){
		x+=xspd
	    y+=yspd
	    
	    //relative to charecter
	    var _refrencex=oPlayer.x-x
	    var _refrencey=oPlayer.y-y
	    
	    if (_refrencex>=320-thresholdX) {
	    	xspd+=1
	    }else{
	    	xspd-=1
	    }
	    
	    if (_refrencex<=-320+thresholdX) {
	    	xspd-=1
	    }else{
	    	xspd+=1
	    }
	    
	    if (_refrencey>=180-thresholdY) {
	    	yspd+=1
	    }else{
	    	yspd-=1
	    }
	    
	    if (_refrencey<=-180+thresholdY) {
	    	yspd-=1
	    }else{
	    	yspd+=1
	    }
	    
	    xspd-=xspd*dragX
	    yspd-=yspd*dragY
	}else{
		if (oPlayer.moveDir<0){
			xOffset-=xSmoothing
		}
		
		if (oPlayer.moveDir>0){
			xOffset+=xSmoothing
		}
		
		if (abs(xOffset)>oPlayer.moveDir*maxOffset){
			xOffset=oPlayer.moveDir*maxOffset
		}
		
		x=lerp(x,oPlayer.x,0.05)+xOffset
		y=lerp(y,oPlayer.y,0.1)
	}
}
