if (!oMenu.paused){
	if (place_meeting(x,oPlayer.y,oPlayer) and keyboard_check(ord("Q"))){
		if (global.finalCoins >= card.cost){
			array_push(global.skills,card.title)
			oCamera.shakeValue = 2
			oCamera.shakePower = 2
			global.finalCoins -= card.cost
			global.cards[array_get_index(global.cards,card)].cost+=1
			instance_destroy()
		}
	}
	
	tick++
	y+=sin(tick/16)/2
}