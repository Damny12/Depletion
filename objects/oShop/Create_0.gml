audio_play_sound(No_1_Upbeat, 1, true, global.volume/100)

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