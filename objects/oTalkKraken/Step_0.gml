if (!oMenu.paused){
	if (place_meeting(x,y,oPlayer)){
		x = 0
		y = 0
		if (instance_exists(dialogue)){
			instance_destroy(dialogue)
		}else{
			background = instance_create_depth(display_get_gui_width()/2,display_get_gui_height()-200,-99,oButton,{
				func:function(){},
				sprite_index:sDialogueBox,
				button_text:"",
				follow_player:true,
				image_xscale:(display_get_gui_width()/sprite_get_width(sDialogueBox))-2,
				image_yscale:20,
				image_alpha:0.95,
				allow_hovering:false
			})
			
			dialogue = instance_create_depth(x,y,-100,oDialouge,{
				text:dialogueText,
				wrapLetters:wrap,
				textValue:textValue,
				textPower:textPower,
				size:textSize,
				ticksNeeded:textDelay,
				isLetters:useLetters,
				dissapearTicks:deleteTicks
			})
			
			speakerIcon = instance_create_depth(display_get_gui_width()/2,display_get_gui_height()-300,-98,oButton,{
				func:function(){},
				sprite_index:sKraken,
				button_text:"",
				follow_player:true,
				allow_hovering:false,
				image_xscale:4,
				image_yscale:4
			})
		}
	}
	
	if (!instance_exists(dialogue)){
		instance_destroy(background)
		instance_destroy(speakerIcon)
		
		instance_create_layer(x,y,"Boss",oKraken)
		instance_destroy()
	}
}