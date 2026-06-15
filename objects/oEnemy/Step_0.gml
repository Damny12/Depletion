if (devEnemy and !global.devMode){
    instance_destroy(self)
}

if (!oMenu.paused){ 
    healTick++
    knockBackTick++
    if (abs(xspd)>=termVel and knockBackTick>=0){
        xspd=termVel*sign(xspd)
    }
    
    x+=xspd*xSpeedMult
    
    if (leftRightMovement){
     movespeed=defaultMoveSpeed*movDir
     
     if(place_meeting(x+xspd,y,layer_tilemap_get_id("Ground")) /*Did i hit a wall?*/ or !place_meeting(x+xspd,y+32,layer_tilemap_get_id("Ground")) /*Is there ground infront of me?*/) {
        x-=movespeed*movDir*xspd
        xspd=0
        movDir*=-1
     }
     
     //Can I see the player
     function lookAndRun(){
        for (i=1;i<=range;i++) {
            if (place_meeting(x+i*32*movDir,y,oPlayer)){
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
    if (iframes==0 && place_meeting(x,y,oAttack)){
        hp-=oPlayer.attackDmg
        iframes=secondsOfInvincibility*30
        if (oPlayer.poisonDmg>0){
            poisonedDuration=60
        }
        var hitPartSysLeft=part_system_create(ParticleSystemHitLeft)
        var hitPartSysRight=part_system_create(ParticleSystemHitRight)
        
        if (sign(oAttack.image_xscale)<0){
            part_system_position(hitPartSysRight,x,y)
        }
        
        if (sign(oAttack.image_xscale)>0){
            part_system_position(hitPartSysLeft,x,y)
        }
        
        xspd=sign(oAttack.image_xscale)*termVel*oPlayer.knockbackMult
        if(place_meeting(x+xspd,y,layer_tilemap_get_id("Ground")) /*Did i hit a wall?*/ or !place_meeting(x+xspd,y+32,layer_tilemap_get_id("Ground")) /*Is there ground infront of me?*/) {
            x-=movespeed*movDir*xspd
            xspd=0
            movDir*=-1
        }
        knockBackTick= -20
        oPlayer.xspd-=sign(oAttack.image_xscale)*oPlayer.xTermvel*oPlayer.knockbackMult
        oPlayer.knockbackTick=knockBackTick
    }
    
    //posion
    if (poisonedDuration>0){
         show_debug_message(poisonedDuration)
         show_debug_message(oPlayer.poisonTicks)
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
    if (healTick mod healTicks==0){
       hp+=healAmount
       if (hp>(defaultHp+global.enemyHp)){
           hp = global.enemyHp+defaultHp
       }
    } 
    
    xspd/=xFriction
}