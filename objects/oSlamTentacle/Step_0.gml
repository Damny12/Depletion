if (!oMenu.paused){
	y = powerTween(ogY, 576, ticks/100, 2)
	
	if (!landed){
		ticks += 1
	}
	
	if (place_meeting(x,y,layer_tilemap_get_id("Ground")) and !landed){
		oCamera.shakePower = 2
		oCamera.shakeValue = 1.5
		landed = true
		stretchY = -0.1*image_yscale
		stretchX = 2*image_xscale
	}
	
	while (place_meeting(x,y,layer_tilemap_get_id("Ground")) and landed){
		y-=1
	}
	
	y+=1
	
	stretchX = powerTween(stretchX, 0,0.35,2)
	stretchY = powerTween(stretchY, 0,0.35,2)
	
	if (place_meeting(x,y,global.weapon) and hitTicks <= 0){
		oKraken.hp -= oPlayer.attackDmg
		hitTicks = oPlayer.attackLength
		if (oPlayer.poisonDmg>0){
			poisonedDuration=60
		}
	}
	
	if (landed){
		hitTicks -= 1 
	}
	
	if (hitTicks == 0){
		hits += 1
	}
	
	if (hitTicks <= -120 or hits >= 2){
		ticks -= 2
	}
}