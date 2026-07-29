if (!oMenu.paused){
	
	//pahse 1: tentacle grabbing phase
	if (phase == 1){
		if (ticks >= tentacleDelay){
			mostRecent = instance_create_layer(oPlayer.x, 576, "Boss", oTentacle,{
				image_xscale:3,
				image_yscale:3
			})
			attacks += 1
			ticks = 0
		}
		
		//deletes tentacle to remove comboing
		if (oPlayer.grabbed and oPlayer.grabTarget != mostRecent and instance_exists(mostRecent)){
			instance_destroy(mostRecent)
		}
		
		if (attacks >= tentacleAttacks){
			attacks = 0
			phase += 1
		}
	}
	
	//phase 2: tentacle slam
	if (phase == 2){
		if (ticks >= tentacleSlamDelay){
			mostRecent = instance_create_layer(1312, 0, "Enemy", oSlamTentacle, {
				image_xscale:6,
				image_yscale:6
			})
			
			attacks += 1
			ticks = 0
		}
		
		if (attacks >= tentacleSlamAttacks){
			attacks = 0
			phase += 1
			ticks = tentacleSlamDelay
		}
	}
	
	//posion
    if (poisonedDuration>0){
         if (array_contains(oPlayer.poisonTicks,poisonedDuration)){
         	hp-=oPlayer.poisonDmg
         }
         poisonedDuration--
    }
    
    //take damage
    if (array_contains(oPlayer.poisonTicks,poisonedDuration) && poisonedDuration==0){
		hp-=oPlayer.poisonDmg
		poisonedDuration=-1
    }
	
	ticks += tickAmount
	
	stretchX = powerTween(stretchX, 0,0.35,2)
	stretchY = powerTween(stretchY, 0,0.35,2)
}