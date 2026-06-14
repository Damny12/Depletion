function newCard(cardX,cardY,image,cardCost,cardName){
	
	var cardImage=instance_create_depth(cardX,cardY,-1,oImage,{
		sprite_index:image,
		cost:cardCost,
		skillName:cardName,
		buttonId:noone,
        image_yscale:2,
        image_xscale:2,
        isCard:true
	})
	
	var button=newButton(cardX,cardY+84,18,36,"",method(cardImage,function(){
		clickUpgrade(cost,skillName)
	}))
	
	cardImage.buttonId=button.id
}