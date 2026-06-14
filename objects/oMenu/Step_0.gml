if (keyboard_check_pressed(vk_escape)){
    paused=!paused
    
    if (paused){
        keyboard_string=""
        quitToMenu=instance_create_layer(oCamera.x,oCamera.y-50,"Ladder",oButton,{
            image_xscale:20,
            image_yscale:5,
            font_size:3,
            button_text:"Quit To Menu",
            func:function() {room_goto(Menu)}
        })
        
        quitGame=instance_create_layer(oCamera.x,oCamera.y+50,"Ladder",oButton,{
            image_xscale:20,
            image_yscale:5,
            font_size:3,
            button_text:"Quit",
            func:function() {game_end()}
        })
        
        if (global.devMode){
            goToTutorial=instance_create_layer(oCamera.x,oCamera.y+150,"Ladder",oButton,{   
                image_xscale:20,
                image_yscale:5,
                font_size:3,
                button_text:"Test Dummy",
                func:function() {room_goto(Tutorial)}
            })
            
            adminPanel=instance_create_layer(oCamera.x,oCamera.y-150,"Ladder",oButton,{   
                image_xscale:20,
                image_yscale:5,
                font_size:3,
                button_text:"Get Upgrade",
                func:function() {array_push(global.skills,"Strength")}
            })
        }
    }else {
    	instance_destroy(quitToMenu)
        instance_destroy(quitGame)
        if (global.devMode){
            instance_destroy(adminPanel)
            instance_destroy(goToTutorial)
        }
    }
}