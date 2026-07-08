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
		
		if (abs(xOffset)>oPlayer.moveDir*maxOffsetStill and oPlayer.moveDir == 0){
			xOffset=oPlayer.moveDir*maxOffsetStill
		}
		
		if (abs(xOffset)>oPlayer.moveDir*maxOffset and oPlayer.moveDir != 0){
			xOffset=oPlayer.moveDir*maxOffset
		}
		
		shake = power(shakeValue, 2) * shakePower
		x=lerp(x,oPlayer.x,0.05)+xOffset+random_range(-shake, shake)
		y=lerp(y,oPlayer.y,0.1)+random_range(-shake, shake)
		
		if (shakeValue > 0){
			shakeValue-=0.1
		}
		camera_set_view_angle(view_camera[0], random_range(-shake, shake)/100)
	}
}
