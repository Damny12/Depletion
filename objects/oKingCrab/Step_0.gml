if (attackTick%delayBetweenAttacks==0 and attackTick!=0){
	instance_create_layer(oPlayer.x,oPlayer.y,"Ladder",oCrabSpawner)
}
attackTick++

//Iframes
iframes--

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
		
		if (_attackWeapon[i].knockBackPlayer){
			oPlayer.xspd-=sign(_attackWeapon[i].image_xscale)*oPlayer.xTermvel*oPlayer.knockbackMult
			oPlayer.knockbackTick=-20
		}
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