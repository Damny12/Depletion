if (!oMenu.paused){
	if (place_meeting(x,oPlayer.y,oPlayer) and keyboard_check(ord("Q"))){
		if (global.finalCoins >= card.cost){
			array_push(global.skills,card.title)
			array_push(oUpgradeSpawner.chosenCards,card)
			oCamera.shakeValue = 2
			oCamera.shakePower = 2
			global.finalCoins -= card.cost
			card.inflate()
			instance_destroy()
		}
	}
	
	tick++
	y+=sin(tick/16)/2
}