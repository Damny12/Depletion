text=[]

switch room{
	case Menu:
		newButton(688,224,78,10,"Play",function(){room_goto(Levels)})
		newButton(688,500,78,10,"Settings",function(){room_goto(Levels)})
	break
	
	case Tutorial:
		text=[["{0} to move right and {1} to move left",]]
		newButton(688,224,78,10,"Play",function(){room_goto(Levels)})
		newButton(688,500,78,10,"Settings",function(){room_goto(Levels)})
	break
}