if (create){
	amount += 1
	create = false
	
	if (amount == 1){
		instance_create_layer(256,288,"PlayerStuff",oUpgrade)
	}
	
	if (amount == 2){
		instance_create_layer(576,288,"PlayerStuff",oUpgrade)
	}
	
	if (amount == 3){
		instance_create_layer(864,288,"PlayerStuff",oUpgrade)
	}
}