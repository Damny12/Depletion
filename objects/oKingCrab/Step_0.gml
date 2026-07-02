if (!oMenu.paused){
	if (randomAttack==1){
		if (attackTick%delayBetweenAttacks==0 and attackTick!=0){
			instance_create_layer(oPlayer.x,y-64,"Ladder",oCrabSpawner)
			attacks++
		}
		shows=false
	}
	
	if (randomAttack==2){
		x=oPlayer.x
		sprite_index=sKingCrabYell
		depth=750
		image_xscale=8
		image_yscale=8
		image_alpha=0.6
		shows=true
		if (attackTick%delayBetweenAttacks==0 and attackTick!=0){
			instance_create_layer(oPlayer.x-128,y-64,"Enemy",oCrab,{
				defaultHp:2,
				corpseDespawnTimer:60,
				knockBackMult:0.1
			})
			attacks++
		}
	}
	
	if (crabAttacks==attacks){
		if (randomAttack==2){
			randomAttack=1
		}else{
			randomAttack++
		}
		phases++
		if (randomAttack==1){
			attacks=0
			delayBetweenAttacks=60
		}
		
		if (randomAttack==2){
			attacks=0
			y=ogY+64
			delayBetweenAttacks=120
		}
		
		if (phases>0 and phases % 2 == 0){
			instance_create_layer(oPlayer.x+irandom_range(-64,64),oPlayer.y-256,"PlayerStuff",oBreath)
			hp-=10
		}
	}
	
	attackTick++
	
	//Iframes
	iframes--
	
	if (iframes<0) {
		iframes=0
	}
	
	if (hp<=0){
		instance_create_layer(oPlayer.x,oPlayer.y,"Ladder",oLadder)
		instance_destroy()
	}
}