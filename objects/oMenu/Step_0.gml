if (keyboard_check_pressed(vk_escape)){
    paused=!paused
    
    if (paused){
        keyboard_string=""
        
        if (global.devMode){
			quitToMenu=instance_create_layer(display_get_gui_width()/2,display_get_gui_height()/3-125,"Ladder",oButton,{
	            image_xscale:60,
	            image_yscale:12,
	            font_size:7,
	            button_text:"Quit To Menu",
				follow_player:true,
	            func:function() {room_goto(Menu)}
	        }) 
			
			quitGame=instance_create_layer(display_get_gui_width()/2,display_get_gui_height()*2/3-125,"Ladder",oButton,{
	            image_xscale:60,
	            image_yscale:12,
	            font_size:7,
	            button_text:"Quit",
				follow_player:true,
	            func:function() {game_end()}
	        })
			
            goToTutorial=instance_create_layer(display_get_gui_width()/2,display_get_gui_height()-125,"Ladder",oButton,{   
                image_xscale:60,
	            image_yscale:12,
	            font_size:7,
                button_text:"Test Dummy",
				follow_player:true,
                func:function() {room_goto(Tutorial)}
            })
        }else{
			quitGame=instance_create_layer(display_get_gui_width()/2,display_get_gui_height()/2-125,"Ladder",oButton,{
	            image_xscale:60,
	            image_yscale:12,
	            font_size:7,
	            button_text:"Quit",
				follow_player:true,
	            func:function() {game_end()}
	        })
			
			quitToMenu=instance_create_layer(display_get_gui_width()/2,display_get_gui_height()/2+125,"Ladder",oButton,{
	            image_xscale:60,
	            image_yscale:12,
	            font_size:7,
	            button_text:"Quit To Menu",
				follow_player:true,
	            func:function() {room_goto(Menu)}
	        }) 
		}
    }else {
    	instance_destroy(quitToMenu)
        instance_destroy(quitGame)
        if (global.devMode){
            instance_destroy(goToTutorial)
        }
    }
}