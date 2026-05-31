function newCard(cardX,cardY,image,cardCost,cardName){
	
	var cardImage=instance_create_depth(cardX,cardY,-1,Image,{
		imagechoice:image,
		cost:cardCost,
		skillName:cardName,
		buttonId:noone
	})
	
	var button=newButton(cardX,cardY+84,18,36,"",method(cardImage,function(){
		clickUpgrade(cost,skillName)
	}))
	
	cardImage.buttonId=button.id
}