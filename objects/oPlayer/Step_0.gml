if (!oMenu.paused){
	if (global.floorLevel mod 5 == 0 and room!=BossRoom and global.floorLevel<0){
		room_goto(BossRoom)
	}
	
    //inputs
    var right_key = keyboard_check(vk_right)||keyboard_check(ord(global.rightKey))
    var left_key = keyboard_check(vk_left)||keyboard_check(ord(global.leftKey))
    var up_key = keyboard_check(vk_space)||keyboard_check(ord(global.spaceKey))||keyboard_check(vk_up)
    var attack_key = keyboard_check(ord("E"))||keyboard_check(ord(global.attackKey))
    
    if (sign(xspd) != 0){
        prevDir=sign(xspd)
    }
    
    if (keyboard_check(vk_f1) && keyboard_check(vk_shift) && global.devMode) {
    	global.finalOxygen=floor(oxygen)
    	coinCount=global.finalOxygen
    	coins=coinCount
    	makingCoins=true
        lastCollect=true
		endY=y
    }
    
	if (keyboard_check(vk_f2) && keyboard_check(vk_shift) && global.devMode) {
		oxygen = 0
	}
	
    var _ground=layer_tilemap_get_id("Ground")
    var _bouncers=[oCorpse]
    var _killers=layer_tilemap_get_id("Die")
    var _enemies=global.enemies
    var _projectiles=global.projectiles
	
    //update
    global.drainMult=drainMult
    ticks++
    
    //x movement
    
    //direction
    moveDir=right_key-left_key
    
    //xspd
    xspd+=moveDir*moveSpd
    
    if (abs(xspd)>=xTermvel){
        xspd=xTermvel*moveDir
    }
    
    xspd/=xFriction
    
    //collison
    var _subpixel = 0.25
    
    if (place_meeting(x+xspd,y,_ground)){
    	var _pixelCheck= _subpixel*sign(xspd)
    	
    	while(!place_meeting(x+xspd,y,_ground)){
    		x-=_pixelCheck
    	}
    	
    	xspd=0
    }
    
    //damaging
    for (var i=0;i<array_length(_enemies);i++){
		if (instance_exists(_enemies[i])){
			if (abs(y - _enemies[i].y) <= 128 and abs(x - _enemies[i].x) <= 24){
				if (attack_key and attackDebounce<=0 and (global.weapon == oAttack or global.weapon == oHammer)){
					attackObject = instance_create_layer(x,y,"PlayerStuff",global.weapon,{
						sprite_index:sDownSlash
					})
					
					attackDebounce=(attackCooldown/2)+attackLength
					
					yspd = -4
				}
				
				if (global.weapon == oHammer){
					for (var j = array_length(hammerOxygen)-1; j>=0; j--){
						if (hammerOxygen[j]<oxygen){
							oxygen = hammerOxygen[j]
							source = "Enemy"
							oOxygenBar.loss=true
							oCamera.shakePower = 4
							oCamera.shakeValue = 2
							break
						}
						
						if (i == 0){
							instance_destroy(attackObject)
						}
					
					}
				}
			}
			
	    	if (place_meeting(x,y,_enemies[i]) and iframes<=0 and _enemies[i].damageMult>0){
	            source="Enemy"
	            oOxygenBar.loss=true
	    		oxygen-=enemyDrain*drainMult*_enemies[i].damageMult
	    		iframes=50
	    		xspd=5*sign(x-_enemies[i].x)*_enemies[i].knockBackMult
				yspd=-4
				knockbackTicks=-30
	    		glideToggle=false
				
				oCamera.shakePower = 3
				oCamera.shakeValue = 2
				
				if (place_meeting(x+xspd,y,_ground)){
			    	var _pixelCheck= _subpixel*sign(xspd)
			    	
			    	while(!place_meeting(x+xspd,y,_ground)){
			    		x-=_pixelCheck
			    	}
			    	
			    	xspd=0
			    }
	    	}
		}
    }
	
	for (var i=0;i<array_length(_projectiles);i++){
    	if (place_meeting(x,y,_projectiles[i]) and iframes<=0){
            source="Enemy"
            oOxygenBar.loss=true
    		oxygen-=enemyDrain*drainMult*_projectiles[i].damageMult
    		iframes=25
			xspd=4*sign(x-_projectiles[i].x)*_projectiles[i].knockBackMult
			yspd=-3
			knockbackTicks=-30
    		glideToggle=false
			
			oCamera.shakePower = 2
			oCamera.shakeValue = 2
			
			if (place_meeting(x+xspd,y,_ground)){
		    	var _pixelCheck= _subpixel*sign(xspd)
		    	
		    	while(!place_meeting(x+xspd,y,_ground)){
		    		x-=_pixelCheck
		    	}
		    	
		    	xspd=0
		    }
			
			if (array_contains(_projectiles[i].hitObject,oPlayer)){
				instance_destroy(_projectiles[i])
			}
    	}
    }
    
    //Movement
    
    //Y movement
    
    //gravity
    yspd+=grav
    if (yspd>termvel){
    	yspd=termvel
    }
    
    //bouncin' on the trampoline
    if (place_meeting(x,y,_bouncers)){
    	if (yspd<=0){
    			yspd=-5
    		} else{
    			yspd*=-2
    			if (abs(yspd)>6 and sign(yspd)!=0){ 
    				yspd=6*sign(yspd)
    			}
    	}
    	glideToggle=false
    }
    
    //jump
    if (up_key and place_meeting(x,y+(sign(grav)),_ground) and !inAir){
    	yspd=jmpspd
    	oxygen+=jmpspd*naturalDrain*3*drainMult
        inAir=true
		
		//scaling
		stretchY = 1.5
		stretchX = -1
        
        source="Jump"
        oOxygenBar.loss=true
    }
    
    //y collide
    _subpixel = 0.5 //might need changing later
    
    if (place_meeting(x,y+yspd,_ground)){
    	var _pixelCheck= _subpixel*sign(yspd)
    	
    	while(!place_meeting(x,y + yspd,_ground)){
    		y-=_pixelCheck*sign(grav)
    	}
    	
		if (inAir == true or yspd >= 4){ 
			stretchY = lerp(0,-0.5,clamp(yspd/4,0,2))
			stretchX = lerp(0,1,clamp(yspd/4,0,1))
			oCamera.shakePower = lerp(0,2,clamp(yspd/4,0,1))
			oCamera.shakeValue = lerp(0,2,clamp(yspd/4,0,1))
		}
		
		inAir=false
		
    	yspd=0
    	glideToggle=false
		
		if (tilemap_get_at_pixel(_ground,x,y+yspd) == 3){
			instance_create_layer(x+96, y -256, "Enemy", oCrabSpawner)
		}
    }
	
	//get out of ground
	if (place_meeting(x,y-0.1,_ground) and place_meeting(x,y+0.1,_ground)){

    	while(place_meeting(x,y + 1,_ground)){
    		y-=_subpixel*sign(grav)+10
    	}
		
		while(place_meeting(x,y - 1,_ground)){
    		y+=_subpixel*sign(grav)+10
    	}
    	
    	yspd=0
    	glideToggle=false
        inAir=true
    }
    
    //Hanging
    if (place_meeting(x,y-yspd,layer_tilemap_get_id("Ground"))){
    			grav =- defaultgrav
    			jmpspd=1
    			oxygen-=movementDrain*drainMult
    	}else{
    			grav=defaultgrav
    			jmpspd=defaultjump
    }
    
    //glide
    if (Count(global.skills,"Glide") >= 1 && yspd >= termvel-2.5){
    	glideToggle=true
    }
    
    if (glideToggle){
    	grav=glideGrav
    	moveSpd=glideSpeed
    	if (yspd>glideTerminal){
    		yspd-=glideSoftCapSpeed
    	}
    }else{
    	moveSpd=defaultMoveSpd
    	termvel=defaultTermVel
    }
    
    if (knockbackTicks>=0){
        xTermvel=defaultXTermvel
        moveSpd=defaultMoveSpd
    }else{
        xTermvel=10
        moveSpd=knockbackMoveSpd
    }
    
    //sprite changing
    function change(){
    	if (glideToggle){
    		sprite_index=sSlimeGlide
    		return
    	}
    	
    	if (sign(round(yspd))<0){
    		sprite_index=sJumpSlime
    		return  
    	}
    	
    	if (sign(round(yspd))>0){
    		sprite_index=sFallSlime
    		return
    	}
    	
    	if (sign(xspd)==1){
    		sprite_index=sMovRight
    		return
    	}
    	
    	if (sign(xspd)==-1){
    		sprite_index=sMoveLeft
    		return
    	}
    	
    	if (sign(xspd)==0){
    		sprite_index=sSleepSlime
    		return
    	}
    }
    
    //die
    if (place_meeting(x,y,_killers)){
		oxygen-=naturalDrain*10*drainMult
		lavaTick=60
	}else{
		lavaTick=1
	}
	
	var breaths = [oBreath]
	for (var i = 0; i < array_length(breaths); i++) {
		if (place_meeting(x,y,breaths[i])){
			oxygen+=1
			instance_destroy(breaths[i])
		}
	}
    
    //oxygen
    oxygen-=naturalDrain*drainMult
    oxygen-=movementDrain*xspd*moveDir*drainMult
    
    if (oxygen<=0){
		global.finalCoins-=totalCoins
    	room_goto(Death)
    }
    
    //attacking
    if (attack_key && attackDebounce<=0){
    	attackObject=instance_create_layer(x,y,"PlayerStuff",attackWeapon,{
            image_xscale:sign(xspd)
        })
        if (sign(xspd)==0){
            attackObject.image_xscale=prevDir
        }
    	attackDebounce=attackCooldown+attackLength
		
		if (global.weapon == oHammer){
			for (var i = array_length(hammerOxygen)-1; i>=0; i--){
				if (hammerOxygen[i]<oxygen){
					oxygen = hammerOxygen[i]
					source = "Enemy"
					oOxygenBar.loss=true
					oCamera.shakePower = 4
					oCamera.shakeValue = 2
					break
				}
				
				if (i == 0){
					instance_destroy(attackObject)
				}
			}
		}
    }
	
	//move
    y+=yspd
    x+=xspd
	
    //coins
    if (place_meeting(x,y,oLadder) and lastCollect==false){
        if (room==Tutorial){
            room_goto(Levels)
        }else{
            lastCollect=true
            global.finalOxygen=floor(oxygen-2.2)
           	coinCount=(global.finalOxygen*global.coinOxygenConversion)
           	coins+=coinCount
           	makingCoins=true
			endY=y
			global.chosenCards = []
        }
    }
    
    if (global.finalEnemyKillCoins!=0){ 
        coinCount=global.finalEnemyKillCoins
        global.finalEnemyKillCoins-=coinCount
        coins+=coinCount
        makingCoins=true
    }
    
    iframes-=1
    attackDebounce-=1
    
    //increase drain
    if (ticks mod 60==0){
        drainMult+=drainIncrease
        global.coinOxygenConversion+=drainIncrease
    }
    
	bubbleTick=120/lavaTick
	
    if (ticks mod bubbleTick==0 and !global.deactivateBubbles){
        instance_create_layer(x,y,"PlayerStuff",oBubble)
    }
	
	if (lavaTick>1){
		oOxygenBar.loss=true
		oCamera.shakePower = 1.1
		oCamera.shakeValue = 2
	}
    
    //coin
    if (makingCoins){
        if (lastCollect){
            drainMult=0
			x = oLadder.x + 16
			grav=0
			yspd=0
			if (coinFrame % 30 == 0){
				y-=8
			}
        }
        
		//create coin
    	if (coinFrame==0 and !coins<=0 and !global.deactivateCoins){
            instance_create_layer(x,y,"Ladder",oCoin)
			
			stretchY+=1
			stretchX-=0.5
    	}
    	
    	coinFrame+=1
    	
    	if (coinFrame==round(secondDelay*30/coinCount) and !coins<=0){
    		coins-=1
    		global.finalCoins+=1
			totalCoins+=1
    	}
    	
    	if (coinFrame>=round(secondDelay*60/coinCount) and !coins<=0){
    		drawCoin=false
    		coinFrame=0
    	}
    	
    	if (coins<=0 and coinFrame>=90){
    		makingCoins=false
            if (lastCollect and coinFrame){
				if (room == Levels or room == Tutorial){
					global.enemyHp+=1
					room_goto(PhysicalShop)
				}else{
					room_goto(Levels)
					global.coinOxygenConversion = 1
				}
            }
    	}
    }
	
    change()
    knockbackTicks++
	
	//lerp stretching
	stretchX = quadraticTween(stretchX, 0,0.35)
	stretchY = quadraticTween(stretchY, 0,0.35)
}