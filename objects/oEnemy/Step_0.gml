tileSize=32*movDir
x+=movespeed*movDir

if (leftRightMovement){
	//Is there ground infront of me
	if(place_meeting(x,y,layer_tilemap_get_id("Ground")) or !place_meeting(x+tileSize,y+32,layer_tilemap_get_id("Ground"))) {
		x-=movespeed*movDir
		movDir*=-1
	}

	//Can I see the player
	function lookAndRun(){
		for (i=1;i<=range;i++) {
			if (place_meeting(x+i*32*movDir,y,oSlime)){
				//Get angry
				movespeed=defaultMoveSpeed*angerMult
				sprite_index=angerSprite
				return
			}else{
				//Calm down
				movespeed=defaultMoveSpeed
				sprite_index=calmSprite
			}
		}
	}
	
	if (getsAngry){
		//Call the function
		lookAndRun()
	}
}

//Iframes
iframes-=1

if (iframes<0) {
	iframes=0
}

if (iframes==0 && oSlime.sprite_index==sSlimeAttack && place_meeting(x,y,oSlime)){
	hp-=oSlime.attackDmg
	iframes=secondsOfInvincibility*30
	if (oSlime.poisonDmg>0){
		poisonedDuration=60
	}
}

//posion
if (poisonedDuration>0){
	if (array_contains(oSlime.poisonTicks,poisonedDuration)){
		hp-=oSlime.poisonDmg
	}
	poisonedDuration-=1
}

if (array_contains(oSlime.poisonTicks,poisonedDuration) && poisonedDuration==0){
	hp-=oSlime.poisonDmg
	poisonedDuration=-1
}

//defeat
if (hp<=0){
	//reward
	global.finalEnemyKillCoins+=3
	
	//corpse
	instance_create_layer(x,y,"Enemy",corpse,{
		sprite_index:corpseSprite
	})
	instance_destroy()
}