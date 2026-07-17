canBeWeapon = true
whitelist = global.cards

rand = irandom_range(0,array_length(global.cards) - 1)
card = global.cards[rand]


for (var i = 0; i < array_length(oUpgradeSpawner.chosenCards); i++) {
	if (oUpgradeSpawner.chosenCards[i].isWeapon) {
		show_debug_message("No more Weapons")
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

containsBlacklist = array_contains(card.weapon,global.weapon) and card.weapon[0]=="!"
missingWhitelist = !array_contains(card.weapon,global.weapon) and card.weapon[0]!="!"
isWeaponWhenShouldntBe = card.isWeapon and !canBeWeapon
while (containsBlacklist or missingWhitelist or isWeaponWhenShouldntBe) { 
	containsBlacklist = array_contains(card.weapon,global.weapon) and card.weapon[0]=="!"
	missingWhitelist = !array_contains(card.weapon,global.weapon) and card.weapon[0]!="!"
	isWeaponWhenShouldntBe = card.isWeapon and !canBeWeapon
	
	if (card.isWeapon and !canBeWeapon){
		removeAndReroll()
		continue
	}
	
	if (card.weapon[0] == "!") {
		if (array_contains(card.weapon, global.weapon)){
			removeAndReroll()
			continue
		}
	}else{
		if (!array_contains(card.weapon, global.weapon)){
			removeAndReroll()
			continue
		}
	}
}

sprite_index = card.asset

global.coinOxygenConversion = 0
tick = 0
y-=32

if (array_get_index(global.cards,card) == -1){
	show_debug_message("Reload Cards...")
	//reload cards
	global.cards=[{
		title:"Poison",
		asset:poison,
		cost:4,
		weapon:[global.weapon],
		isWeapon:false
	},{
		title:"Strength",
		asset:strength,
		cost:5,
		weapon:[global.weapon],
		isWeapon:false
	},{
		title:"Knockback",
		asset:knockback,
		cost:3,
		weapon:[global.weapon],
		isWeapon:false
	},{
		title:"Breathing",
		asset:BreathHolding,
		cost:6,
		weapon:[global.weapon],
		isWeapon:false
	},{
		title:"Bow",
		asset:BowAndArrow,
		cost:8,
		weapon:["!",oArrow],
		isWeapon:true
	},{
		title:"Sword",
		asset:Sword,
		cost:11,
		weapon:["!",oAttack],
		isWeapon:true
	},{
		title:"Reload",
		asset:ArrowReload,
		cost:8,
		weapon:[oArrow],
		isWeapon:false
	},{
		title:"Hammer",
		asset:Hammer,
		cost:13,
		weapon:["!",oHammer],
		isWeapon:true
	}]
}

array_push(oUpgradeSpawner.chosenCards,card)
oUpgradeSpawner.create = true

show_debug_message($"card: {card}\n chosenCards: {canBeWeapon}")