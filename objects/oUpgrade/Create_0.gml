canBeWeapon = true
whitelist = global.cards

rand = irandom_range(0,array_length(global.cards) - 1)
card = global.cards[rand]


for (var i = 0; i < array_length(global.chosenCards); i++) {
	try {
		if (global.chosenCards[i].isWeapon) {
			canBeWeapon = false
		}
	}
	catch (error) {}
}


function removeAndReroll(){
	array_delete(whitelist,array_get_index(whitelist,card),1)
	if (array_length(whitelist) <= 0){
		card = {
			title:"Poison",
			asset:poison,
			cost:4,
			weapon:[global.weapon]
		}
		show_debug_message("There was an error in card choosing. Defaulted to Poison")
		return
	}else{
		card = whitelist[irandom_range(0,array_length(whitelist)-1)]
	}
}

containsBlacklist = array_contains(card.weapon,global.weapon) and card.weapon[0]=="!"
missingWhitelist = !array_contains(card.weapon,global.weapon) and card.weapon[0]!="!"
while (containsBlacklist or missingWhitelist) { 
	if (card.weapon[0] == "!") {
		if (array_contains(card.weapon, global.weapon)){
			removeAndReroll()
		}
	}else{
		if (!array_contains(card.weapon, global.weapon)){
			removeAndReroll()
		}
	}
	
	if (card.isWeapon and !canBeWeapon){
		removeAndReroll()
	}
	
	containsBlacklist = array_contains(card.weapon,global.weapon) and card.weapon[0]=="!"
	missingWhitelist = !array_contains(card.weapon,global.weapon) and card.weapon[0]!="!"
}

array_push(global.chosenCards,card)
sprite_index = card.asset

global.coinOxygenConversion = 0
tick = 0
y-=32