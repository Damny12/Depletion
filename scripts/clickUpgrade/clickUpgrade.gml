function clickUpgrade(cost,name){
	if (global.finalCoins >= cost){
		array_push(global.skills,name)
		instance_destroy(self.id)
		instance_destroy(buttonId)
		global.finalCoins-=cost
		
		for (var i = 0; i < cost; i++) {
			coinNoises = [
				coin_1,
				coin_2,
				coin_3,
				coin_4
			]
			
			audio_play_sound(coinNoises[irandom_range(0,3)], i, false, global.volume/100)
		}
	}
}