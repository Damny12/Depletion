counts = []
i = 0

for (y = 416; y <= 576; y+=128) {
	for (x = 256; x <= 1024; x+=128) { 
		skill = noone
		try {
			for (var j = 0; j < array_length(global.cards); j++) {
				if (global.cards[j].title == global.skills[i]){
					skill = global.cards[j].asset
					array_push(counts, skill)
				}
			}
		}
		catch (error) {}
		i++
		
		instance_create_layer(x,y,"Instances", oImage, {
			sprite_index:skill
		})
	}
}
