if (devEnemy and !global.devMode){
    instance_destroy(self)
}

if (!oMenu.paused){ 
	
	yspd+=1
	
	if (place_meeting(x,y+yspd,layer_tilemap_get_id("Ground"))){
		yspd=0
		
		while (place_meeting(x,y,layer_tilemap_get_id("Ground"))){
			y-=0.5
		}
		
		while (place_meeting(x,y,layer_tilemap_get_id("Ground"))){
			y+=0.25
		}
	}
	
	function seeObject(object){
		for (var i=1;i<sightRange;i+=1) {
			if (place_meeting(x+i*32*movDir,y,object)){
				return [true,i]
			}
		}
		return [false, infinity]
	}
	
    healTick++
    knockBackTick++
    if (abs(xspd)>=termVel and knockBackTick>=0){
        xspd=termVel*sign(xspd)
    }
    
    x+=xspd*xSpeedMult
    
    if (leftRightMovement){
     movespeed=defaultMoveSpeed*movDir*wanderSpeed
     
     if(place_meeting(x+xspd,y,layer_tilemap_get_id("Ground")) /*Did i hit a wall?*/ or !place_meeting(x+xspd,y+32,layer_tilemap_get_id("Ground")) /*Is there ground infront of me?*/) {
        x-=movespeed*movDir*xspd
        xspd=0
        movDir*=-1
     }
     
     //Can I see the player
     function lookAndRun(){
		if (seeObject(oPlayer)[0]){
			//Get angry
			movespeed=defaultMoveSpeed*angerMult*movDir
			sprite_index=angerSprite
			return
		}else{
			//Calm down
			movespeed=defaultMoveSpeed*movDir
			sprite_index=calmSprite
		}
     }
     
     if (getsAngry){
        //Call the function
        lookAndRun()
     }
     
     xspd+=movespeed
    }
    
    //Iframes
    iframes-=1
    
    if (iframes<0) {
        iframes=0
    }
    
    //attack
	var _attackWeapon=[oPlayer.attackWeapon]
	for (var i = 0; i<array_length(_attackWeapon); i++;){
		if (iframes==0 && place_meeting(x,y,_attackWeapon[i])){
	        hp-=oPlayer.attackDmg
	        iframes=secondsOfInvincibility*30
	        if (oPlayer.poisonDmg>0){
	            poisonedDuration=60
	        }
			
			if (_attackWeapon[i].knockBackEnemy){
				xspd=sign(_attackWeapon[i].image_xscale)*termVel*oPlayer.knockbackMult
		        if(place_meeting(x+xspd,y,layer_tilemap_get_id("Ground")) /*Did i hit a wall?*/ or !place_meeting(x+xspd,y+32,layer_tilemap_get_id("Ground")) /*Is there ground infront of me?*/) {
		            x-=movespeed*movDir*xspd
		            xspd=0
		            movDir*=-1
		        }
				
				var hitPartSysLeft=part_system_create(ParticleSystemHitLeft)
		        var hitPartSysRight=part_system_create(ParticleSystemHitRight)
		        
		        if (sign(_attackWeapon[i].image_xscale)<0){
		            part_system_position(hitPartSysRight,x,y)
		        }
		        
		        if (sign(_attackWeapon[i].image_xscale)>0){
		            part_system_position(hitPartSysLeft,x,y)
		        }
				
				knockBackTick= -20
			}
			
			if (_attackWeapon[i].knockBackPlayer){
				oPlayer.xspd-=sign(_attackWeapon[i].image_xscale)*oPlayer.xTermvel*oPlayer.knockbackMult
	        	oPlayer.knockbackTick=-20
			}
	    }
	}
    
    //posion
    if (poisonedDuration>0){
         if (array_contains(oPlayer.poisonTicks,poisonedDuration)){
         hp-=oPlayer.poisonDmg*poisonDmgEffectiveness
         }
         poisonedDuration-=1
    }
    
    //take damage
    if (array_contains(oPlayer.poisonTicks,poisonedDuration) && poisonedDuration==0){
     hp-=oPlayer.poisonDmg*poisonDmgEffectiveness
     poisonedDuration=-1
    }
    
    //defeat
    if (hp<=0){
       //reward
       global.finalEnemyKillCoins+=reward
       
       //corpse
       instance_create_layer(x,y,"Enemy",corpse,{
       sprite_index:corpseSprite
       })
       instance_destroy()
 	}
	
	//health regen
    if (healTick mod healTicks==0){
       hp+=healAmount
       if (hp>(defaultHp+global.enemyHp)){
           hp = global.enemyHp+defaultHp
       }
    }
	
	//ranged enemy
	if (ranged){
		movespeed=defaultMoveSpeed*movDir*wanderSpeed
		var _seePlayer=seeObject(oPlayer)
		
		if ((_seePlayer[1] <= backAwayDistance) and backAway and _seePlayer[0]){
			if (x-oPlayer.x <= 0){
				movDir=-1
			}else{
				movDir=1
			}
			wanders=false
			if (shootDelayTick>=0){
				instance_create_layer(x,y,"Enemy",projectileObject,{
					image_xscale:-movDir
				})
				shootDelayTick=-projectileDelay
			}
			shootDelayTick++
			if(place_meeting(x+xspd,y,layer_tilemap_get_id("Ground")) /*Did i hit a wall?*/ or !place_meeting(x+xspd,y+32,layer_tilemap_get_id("Ground")) /*Is there ground infront of me?*/) {
				x-=movespeed*movDir*xspd
				xspd=0
				movDir*=-1
			}
		}else{
			wanders=true
		}
		
		if (wanders){
			xspd+=movespeed
		}
		
		if(place_meeting(x+xspd,y,layer_tilemap_get_id("Ground")) /*Did i hit a wall?*/ or !place_meeting(x+xspd,y+32,layer_tilemap_get_id("Ground")) /*Is there ground infront of me?*/) {
			x-=movespeed*movDir*xspd
			xspd=0
			movDir*=-1
		}
	}
	
	if (wanders){
		wanderTick++
		if (wanderTick==0){
			if (irandom_range(0,1)==0){
				wanderSpeed=0
			}else{
				wanderSpeed=1
				if (irandom_range(0,1)==0){
					movDir=-1
				}else{
					movDir=1
				}
			}
		}
		
		if (wanderTick==wanderSpacing){
			wanderTick=-1
		} 
	}
    
	y+=yspd
    xspd/=xFriction
}