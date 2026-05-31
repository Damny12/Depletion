function clickUpgrade(cost,name){
	if global.finalCoins >= cost{
		array_push(global.skills,name)
		instance_destroy(self.id)
		instance_destroy(buttonId)
		global.finalCoins-=cost
	}
}