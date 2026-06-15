if (!oMenu.paused){
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
    }
    
    var _ground=layer_tilemap_get_id("Ground")
    var _bouncers=[oCorpse]
    var _killers=layer_tilemap_get_id("Die")
    var _enemies=global.enemies
    
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
    var _subpixel = 0.5
    
    if (place_meeting(x+xspd,y,_ground)){
    	var _pixelCheck= _subpixel*sign(xspd)
    	
    	while(!place_meeting(x+xspd,y,_ground)){
    		x+=_pixelCheck
    	}
    	
    	xspd=0
    }
    
    //damaging
    for (var i=0;i<array_length(_enemies);i++){
    	if (place_meeting(x,y,_enemies[i]) and iframes<=0){
            source="Enemy"
            oOxygenBar.loss=true
    		oxygen-=enemyDrain*drainMult*_enemies[i].damageMult
    		iframes=25
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
    }
    
    //Movement
    
    //Y movement
    
    //move
    y+=yspd
    x+=xspd
    
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
    
    //jump that
    if (up_key and place_meeting(x,y+(sign(grav)),_ground) and !jumped){
    	yspd=jmpspd
    	oxygen+=jmpspd*naturalDrain*3*drainMult
        jumped=true
        
        source="Jump"
        oOxygenBar.loss=true
    }
    
    //y collide
    _subpixel = 0.5 //might need changing later
    
    if (place_meeting(x,y+yspd,_ground)){
    	var _pixelCheck= _subpixel*sign(yspd)
    	
    	while(!place_meeting(x,y + yspd,_ground)){
    		y+=_pixelCheck*sign(grav)
    	}
    	
    	yspd=0
    	glideToggle=false
        jumped=false
    }
    
    //Hanging
    if (place_meeting(x,y-yspd,layer_tilemap_get_id("Ground"))){
    			grav=-defaultgrav
    			jmpspd=1
    			oxygen-=movementDrain*drainMult
    	}else{
    			grav=defaultgrav
    			jmpspd=defaultjump
    }
    
    //glide
    if (Count(skillSet,"Glide") >= 1 && yspd >= termvel-2.5){
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
    if (place_meeting(x,y,_killers)) oxygen-=naturalDrain*10*drainMult
    
    //oxygen
    oxygen-=naturalDrain*drainMult
    oxygen-=movementDrain*xspd*moveDir*drainMult
    
    if (oxygen<=0){
    	room_restart()
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
    }
    
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
    
    if (ticks mod 120==0 and !global.deactivateBubbles){
        instance_create_layer(x,y,"PlayerStuff",oBubble)
    }
    
    //coin
    if (makingCoins){
        if (lastCollect){
            drainMult=0
        }
        
    	if (coinFrame==0 and !coins<=0 and !global.deactivateCoins){
            instance_create_layer(x,y,"Ladder",oCoin)
    	}
    	
    	coinFrame+=1
    	
    	if (coinFrame==round(secondDelay*30/coinCount) and !coins<=0){
    		coins-=1
    		global.finalCoins+=1
    	}
    	
    	if (coinFrame>=round(secondDelay*60/coinCount) and !coins<=0){
    		drawCoin=false
    		coinFrame=0
    	}
    	
    	if (coins<=0 and coinFrame>=90){
    		makingCoins=false
            if (lastCollect and coinFrame){
                room_goto(Shop)
            }
    	}
    }
    change()
    knockbackTicks++
}