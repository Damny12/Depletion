audio_play_sound(No_1_Upbeat, 1, true, global.volume/100)

global.cards=[{
	title:"Poison",
	asset:poison,
	cost:4,
	weapon:[global.weapon]
},{
	title:"Strength",
	asset:strength,
	cost:5,
	weapon:[global.weapon]
},{
	title:"Knockback",
	asset:knockback,
	cost:3,
	weapon:[global.weapon]
},{
	title:"Breathing",
	asset:BreathHolding,
	cost:6,
	weapon:[global.weapon]
},{
	title:"Bow",
	asset:BowAndArrow,
	cost:8,
	weapon:["!",oArrow]
},{
	title:"Sword",
	asset:Sword,
	cost:11,
	weapon:["!",oAttack]
},{
	title:"Reload",
	asset:ArrowReload,
	cost:8,
	weapon:[oArrow]
},{
	title:"Hammer",
	asset:Hammer,
	cost:13,
	weapon:["!",oHammer]
}]
function makeCard(){
	card=global.cards[irandom_range(0,(array_length(global.cards)-1))]
	
	while (((array_contains(card.weapon,global.weapon) and card.weapon[0]=="!") or (!array_contains(card.weapon,global.weapon) and card.weapon[0]!="!"))) {
		if (card.weapon[0]=="!"){
			while (array_contains(card.weapon,global.weapon)){
				card=global.cards[irandom_range(0,(array_length(global.cards)-1))]
			}
		}else{
			_prev=card
			while (!array_contains(card.weapon,global.weapon)){
				card=global.cards[irandom_range(0,(array_length(global.cards)-1))]
			}
		}
	}
}
//first card

makeCard()

newCard(273.2,300,card.asset,card.cost,card.title)

//second card

makeCard()

newCard(683,300,card.asset,card.cost,card.title)

//third card
makeCard()

newCard(1092,300,card.asset,card.cost,card.title)

//leave
leaveButton=newButton(1192,50,3,3,"",function(){
	global.enemyHp+=1
	room_goto(Levels)
})

leaveButton.sprite_index=orange_button_restart

if (global.finalCoins>99){
	global.finalCoins=99
}