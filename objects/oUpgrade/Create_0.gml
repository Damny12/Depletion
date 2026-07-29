canBeWeapon = true
whitelist = global.cards

rand = irandom_range(0,array_length(global.cards) - 1)
card = global.cards[rand]


for (var i = 0; i < array_length(oUpgradeSpawner.chosenCards); i++) {
	if (oUpgradeSpawner.chosenCards[i].isWeapon) {
		canBeWeapon = false
	}
}


function removeAndReroll(){
	array_delete(whitelist,array_get_index(whitelist,card),1)
	if (array_length(whitelist) <= 0){
		card = global.cards[0]
		show_debug_message("There was an error in card choosing. Defaulted to Poison")
		return
	}else{
		card = whitelist[irandom_range(0,array_length(whitelist)-1)]
	}
}

show_debug_message(whitelist)

currentWeapon = card.weapon()
containsBlacklist = array_contains(currentWeapon,global.weapon) and currentWeapon[0]=="!"
missingWhitelist = !array_contains(currentWeapon,global.weapon) and currentWeapon[0]!="!"

isWeaponWhenShouldntBe = card.isWeapon and !canBeWeapon

while (containsBlacklist or missingWhitelist or isWeaponWhenShouldntBe) { 
	
	currentWeapon = card.weapon()
	containsBlacklist = array_contains(currentWeapon,global.weapon) and currentWeapon[0]=="!"
	missingWhitelist = !array_contains(currentWeapon,global.weapon) and currentWeapon[0]!="!"
	
	isWeaponWhenShouldntBe = card.isWeapon and !canBeWeapon
	
	if (card.isWeapon and !canBeWeapon){
		removeAndReroll()
		continue
	}
	
	if (currentWeapon[0] == "!") {
		if (array_contains(currentWeapon, global.weapon)){
			removeAndReroll()
			continue
		}
	}else{
		if (!array_contains(currentWeapon, global.weapon)){
			removeAndReroll()
			continue
		}
	}
	
	currentWeapon = card.weapon()
	containsBlacklist = array_contains(currentWeapon,global.weapon) and currentWeapon[0]=="!"
	missingWhitelist = !array_contains(currentWeapon,global.weapon) and currentWeapon[0]!="!"
	
	isWeaponWhenShouldntBe = card.isWeapon and !canBeWeapon
}

sprite_index = card.asset

global.coinOxygenConversion = 0
tick = 0
y-=32

array_push(oUpgradeSpawner.chosenCards,card)
oUpgradeSpawner.create = true